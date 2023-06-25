import 'package:exam/database/database.dart';
import 'package:exam/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constants/impact.dart';
import '../database/entities/sleep.dart';
import '../services/impact_api.dart';

class SleepRepository extends ChangeNotifier implements Repository {
  @override
  final AppDatabase database;

  SleepRepository({required this.database});

  final List<Sleep> _loadedSleep = [];

  void updateDailySleep(DateTime day) async {
    _loadedSleep.clear();
    _loadedSleep.add(await selectDay(day));
    notifyListeners();
  }

  void updateWeeklySleep(DateTime day) async {
    if (_loadedSleep.isEmpty) _loadedSleep.addAll(await selectAll());
    notifyListeners();
  }

  Sleep? get dailySleep => _loadedSleep.isEmpty ? null : _loadedSleep.first;
  List<Sleep> get weeklySleep => _loadedSleep;

  //This method wraps the findAllSleeps() method of the DAO
  @override
  Future<List<Sleep>> selectAll() async {
    List<Sleep> results = await database.sleepDao.findAllSleep();

    if (results.isEmpty) {
      DateTime now = DateTime.now();
      DateTime sevenDaysBefore = DateTime(now.year, now.month, now.day)
          .subtract(const Duration(days: 6));
      List<Sleep>? sleep = await ImpactApi.getSleepRange(
          ImpactDataType.steps, sevenDaysBefore, now);

      if (sleep == null) {
        print("No sleep available");
        return Future.value([
          Sleep(
              startTime: now,
              endTime: now,
              minutesAsleep: 0,
              minutesAwake: 0,
              efficiency: 0,
              date: now,
              duration: 0)
        ]);
      }

      await insert(sleep);

      return Future<List<Sleep>>.value(sleep);
    }

    return results;
  } //findAllSleeps

  @override
  Future<Sleep> selectDay(DateTime day) async {
    final results = await database.sleepDao.findSleep(day);

    if (results.isEmpty) {
      Sleep? sleep = await ImpactApi.getSleep(ImpactDataType.sleep, day);

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
