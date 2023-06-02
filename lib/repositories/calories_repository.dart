import 'package:exam/database/database.dart';
import 'package:exam/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constants/impact.dart';
import '../database/entities/calories.dart';
import '../services/impact_api.dart';

class CaloriesRepository extends ChangeNotifier implements Repository {
  @override
  final AppDatabase database;

  CaloriesRepository({required this.database});

  //This method wraps the findAllCaloriess() method of the DAO
  @override
  Future<List<Calories>> selectAll() async {
    final results = await database.caloriesDao.findAllCalories();

    if (results.isEmpty) {
      final sevenDaysAgo = DateTime.now().subtract(const Duration(days: 7));

      List<Calories>? calories = await ImpactApi.getCaloriesRange(
          ImpactDataType.steps, sevenDaysAgo, DateTime.now());

      if (calories == null) {
        throw Exception("Could not retrieve calories from Impact: ");
      }

      await database.caloriesDao.insertAllCalories(calories);

      return Future<List<Calories>>.value(calories);
    }

    return results;
  } //selectAll

  @override
  Future<Calories> selectDay(DateTime day) async {
    final results = await database.caloriesDao.findCalories(day);

    if (results.isEmpty) {
      Calories? calories =
          await ImpactApi.getCalories(ImpactDataType.calories, day);

      if (calories == null) {
        throw Exception("Could not retrieve calories from Impact: ");
      }

      await database.caloriesDao.insertCalories(calories);

      return Future<Calories>.value(calories);
    }

    return results.first;
  } //selectDay

  //This method wraps the insertCalories() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> insert(calories) async {
    await database.caloriesDao.insertCalories(calories);
    notifyListeners();
  } //insertCalories

  //This method wraps the deleteCalories() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> delete(calories) async {
    await database.caloriesDao.deleteCalories(calories);
    notifyListeners();
  } //removeCalories

  //This method wraps the updateCalories() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> update(calories) async {
    await database.caloriesDao.updateCalories(calories);
    notifyListeners();
  }
} //DatabaseRepository
