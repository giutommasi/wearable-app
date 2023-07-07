import 'package:exam/database/database.dart';
import 'package:exam/repositories/repository.dart';
import 'package:flutter/material.dart';

import '../database/entities/sleep.dart';
import '../services/impact_api.dart';

class SleepRepository extends ChangeNotifier implements Repository {
  @override
  final AppDatabase database;

  SleepRepository({required this.database});

  final List<Sleep> _loadedSleep = [];
  final List<Sleep> _weeklyLoadedSleep = [];

  void updateDailySleep(DateTime day) async {
    _loadedSleep.clear();
    _loadedSleep.add(await selectDay(day));
    notifyListeners();
  }

  void updateWeeklySleep(DateTime day) async {
    if (_loadedSleep.isEmpty) _loadedSleep.addAll(await loadAll());
    notifyListeners();
  }

  Sleep? get dailySleep => _loadedSleep.isEmpty ? null : _loadedSleep.first;
  List<Sleep> get weeklySleep => _weeklyLoadedSleep;

  //This method wraps the findAllSleeps() method of the DAO
  @override
  Future<List<Sleep>> loadAll() async {
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    DateTime sevenDaysAgo = yesterday.subtract(const Duration(days: 7));
    List<Sleep> results =
        await database.sleepDao.findAllSleep(sevenDaysAgo, yesterday);

    if (results.isEmpty || results.length < 7) {
      List<Sleep>? sleep =
          await ImpactApi.getSleepRange(sevenDaysAgo, yesterday);

      if (sleep == null) {
        return Future.value([
          Sleep(
              startTime: yesterday,
              endTime: yesterday,
              minutesAsleep: 0,
              minutesAwake: 0,
              efficiency: 0,
              date: yesterday,
              duration: 0)
        ]);
      }

      await insertAll(sleep);
      _weeklyLoadedSleep.clear();
      _weeklyLoadedSleep.addAll(sleep);
      notifyListeners();

      return Future<List<Sleep>>.value(sleep);
    }

    _weeklyLoadedSleep.clear();
    _weeklyLoadedSleep.addAll(results);
    notifyListeners();

    return results;
  } //findAllSleeps

  @override
  Future<Sleep> selectDay(DateTime day) async {
    final results = await database.sleepDao.findSleep(day);

    if (results.isEmpty) {
      Sleep? sleep = await ImpactApi.getSleep(day);

      if (sleep == null) {
        return Future.value(Sleep(
            startTime: day,
            endTime: day,
            minutesAsleep: 0,
            minutesAwake: 0,
            efficiency: 0,
            date: day,
            duration: 0));
      }

      await insert(sleep);
      _loadedSleep.clear();
      _loadedSleep.add(sleep);
      notifyListeners();

      return Future<Sleep>.value(sleep);
    }

    _loadedSleep.clear();
    _loadedSleep.add(results.first);
    notifyListeners();

    return results.first;
  } //selectDay

  //This method wraps the insertSleep() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> insert(sleep) async {
    await database.sleepDao.insertSleep(sleep);
    notifyListeners();
  } //insertSleep

  @override
  Future<void> insertAll(sleep) async {
    await database.sleepDao.insertAllSleep(sleep.cast<Sleep>());
    notifyListeners();
  } //insertSleep

  //This method wraps the deleteSleep() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> delete(sleep) async {
    await database.sleepDao.deleteSleep(sleep);
    notifyListeners();
  } //removeSleep

  //This method wraps the updateSleep() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> update(sleep) async {
    await database.sleepDao.updateSleep(sleep);
    notifyListeners();
  }
} //DatabaseRepository
