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

  //This method wraps the findAllSleeps() method of the DAO
  @override
  Future<List<Sleep>> selectAll() async {
    List<Sleep> results = await database.sleepDao.findAllSleep();

    if (results.isEmpty) {
      List<Sleep>? sleep = await ImpactApi.getSleepRange(ImpactDataType.steps,
          DateFormat('yyyy-MM-dd').parse("2023-01-01"), DateTime.now());

      if (sleep == null) {
        throw Exception("Could not retrieve steps from Impact: ");
      }

      await database.sleepDao.insertAllSleep(sleep);

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
        throw Exception("Could not retrieve sleep from Impact: ");
      }

      await database.sleepDao.insertSleep(sleep);

      return Future<Sleep>.value(sleep);
    }

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
