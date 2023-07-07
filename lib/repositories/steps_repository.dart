import 'package:exam/database/database.dart';
import 'package:exam/repositories/repository.dart';
import 'package:flutter/material.dart';

import '../database/entities/steps.dart';
import '../services/impact_api.dart';

class StepsRepository extends ChangeNotifier implements Repository {
  @override
  final AppDatabase database;

  StepsRepository({required this.database});

  final List<Steps> _loadedSteps = [];
  final List<Steps> _weeklyLoadedSteps = [];

  void updateDailySteps(DateTime day) async {
    _loadedSteps.clear();
    _loadedSteps.add(await selectDay(day));
    notifyListeners();
  }

  void updateWeeklySteps(DateTime day) async {
    if (_loadedSteps.isEmpty) _loadedSteps.addAll(await loadAll());
    notifyListeners();
  }

  Steps? get dailySteps => _loadedSteps.isEmpty ? null : _loadedSteps.first;
  List<Steps> get weeklySteps => _weeklyLoadedSteps;

  //This method wraps the findAllStepss() method of the DAO
  @override
  Future<List<Steps>> loadAll() async {
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    DateTime sevenDaysAgo = yesterday.subtract(const Duration(days: 7));

    List<Steps> results =
        await database.stepsDao.findAllSteps(sevenDaysAgo, yesterday);

    if (results.isEmpty || results.length < 7) {
      List<Steps>? steps =
          await ImpactApi.getStepsRange(sevenDaysAgo, yesterday);

      if (steps == null) {
        return Future.value(
            [Steps(date: yesterday, steps: 0, last: yesterday)]);
      }

      await insertAll(steps);

      _weeklyLoadedSteps.clear();
      _weeklyLoadedSteps.addAll(steps);
      notifyListeners();

      return Future<List<Steps>>.value(steps);
    }

    _weeklyLoadedSteps.clear();
    _weeklyLoadedSteps.addAll(results);
    notifyListeners();

    return results;
  } //findAllStepss

  @override
  Future<Steps> selectDay(DateTime day) async {
    final results = await database.stepsDao.findSteps(day);

    if (results.isEmpty) {
      DateTime now = DateTime.now();
      Steps? steps = await ImpactApi.getSteps(day);

      if (steps == null) {
        print("Could not retrieve steps from Impact");
        return Future.value(Steps(date: now, steps: 0, last: now));
      }

      await insert(steps);
      _loadedSteps.clear();
      _loadedSteps.add(steps);
      notifyListeners();

      return Future<Steps>.value(steps);
    }

    _loadedSteps.clear();
    _loadedSteps.add(results.first);
    notifyListeners();

    return results.first;
  } //selectDay

  //This method wraps the insertSteps() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> insert(steps) async {
    await database.stepsDao.insertSteps(steps);
    notifyListeners();
  } //insertSteps

  @override
  Future<void> insertAll(steps) async {
    await database.stepsDao.insertAllSteps(steps.cast<Steps>());
    notifyListeners();
  } //insertSteps

  //This method wraps the deleteSteps() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> delete(steps) async {
    await database.stepsDao.deleteSteps(steps);
    notifyListeners();
  } //removeSteps

  //This method wraps the updateSteps() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> update(steps) async {
    await database.stepsDao.updateSteps(steps);
    notifyListeners();
  }
} //DatabaseRepository
