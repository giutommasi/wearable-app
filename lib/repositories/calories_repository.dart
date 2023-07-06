import 'package:exam/database/database.dart';
import 'package:exam/repositories/repository.dart';
import 'package:flutter/material.dart';

import '../database/entities/calories.dart';
import '../services/impact_api.dart';

class CaloriesRepository extends ChangeNotifier implements Repository {
  @override
  final AppDatabase database;

  CaloriesRepository({required this.database});

  final List<Calories> _loadedCalories = [];

  void updateDailyCalories(DateTime day) async {
    _loadedCalories.clear();
    _loadedCalories.add(await selectDay(day));

    notifyListeners();
  }

  void updateWeeklyCalories(DateTime day) async {
    if (_loadedCalories.isEmpty) _loadedCalories.addAll(await loadAll());
    notifyListeners();
  }

  Calories? get dailyCalories =>
      _loadedCalories.isEmpty ? null : _loadedCalories.first;
  List<Calories> get weeklyCalories => _loadedCalories;

  //This method wraps the findAllCaloriess() method of the DAO
  @override
  Future<List<Calories>> loadAll() async {
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    DateTime sevenDaysAgo = yesterday.subtract(const Duration(days: 7));

    final results =
        await database.caloriesDao.findAllCalories(sevenDaysAgo, yesterday);

    if (results.isEmpty || results.length < 7) {
      List<Calories>? calories =
          await ImpactApi.getCaloriesRange(sevenDaysAgo, yesterday);

      if (calories == null) {
        print("No Calories available");
        return Future.value(
            [Calories(date: yesterday, burned: 0, dayOfTheWeek: 1)]);
      }

      await insertAll(calories);
      _loadedCalories.clear();
      _loadedCalories.addAll(calories);
      notifyListeners();

      return Future<List<Calories>>.value(calories);
    }

    _loadedCalories.clear();
    _loadedCalories.addAll(results);
    notifyListeners();

    return results;
  } //selectAll

  @override
  Future<Calories> selectDay(DateTime day) async {
    final results = await database.caloriesDao.findCalories(day);

    if (results.isEmpty) {
      Calories? calories = await ImpactApi.getCalories(day);

      if (calories == null) {
        return Future.value(Calories(date: day, burned: 0, dayOfTheWeek: 1));
      }

      await insert(calories);
      _loadedCalories.clear();
      _loadedCalories.add(calories);
      notifyListeners();
      return Future<Calories>.value(calories);
    }

    _loadedCalories.clear();
    _loadedCalories.add(results.first);
    notifyListeners();

    return results.first;
  } //selectDay

  //This method wraps the insertCalories() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> insert(calories) async {
    await database.caloriesDao.insertCalories(calories);
  } //insertCalories

  @override
  Future<void> insertAll(calories) async {
    await database.caloriesDao.insertAllCalories(calories.cast<Calories>());
  } //insertCalories

  //This method wraps the deleteCalories() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> delete(calories) async {
    await database.caloriesDao.deleteCalories(calories);
  } //removeCalories

  //This method wraps the updateCalories() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> update(calories) async {
    await database.caloriesDao.updateCalories(calories);
  }
} //DatabaseRepository
