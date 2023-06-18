import 'package:exam/Constants/impact.dart';
import 'package:exam/database/database.dart';
import 'package:exam/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../database/entities/steps.dart';
import '../services/impact_api.dart';

class StepsRepository extends ChangeNotifier implements Repository {
  @override
  final AppDatabase database;

  StepsRepository({required this.database});

  //This method wraps the findAllStepss() method of the DAO
  @override
  Future<List<Steps>> selectAll() async {
    List<Steps> results = await database.stepsDao.findAllSteps();

    if (results.isEmpty) {
      List<Steps>? steps = await ImpactApi.getStepsRange(ImpactDataType.steps,
          DateFormat('yyyy-MM-dd').parse("2023-01-01"), DateTime.now());

      if (steps == null) {
        throw Exception("Could not retrieve steps from Impact: ");
      }

      await database.stepsDao.insertAllSteps(steps);

      return Future<List<Steps>>.value(steps);
    }

    return results;
  } //findAllStepss

  @override
  Future<Steps> selectDay(DateTime day) async {
    final results = await database.stepsDao.findSteps(day);

    if (results.isEmpty) {
      Steps? steps = await ImpactApi.getSteps(ImpactDataType.steps, day);

      if (steps == null) {
        throw Exception("Could not retrieve steps from Impact: ");
      }

      await database.stepsDao.insertSteps(steps);

      return Future<Steps>.value(steps);
    }

    return results.first;
  } //selectDay

  //This method wraps the insertSteps() method of the DAO.
  //Then, it notifies the listeners that something changed.
  @override
  Future<void> insert(steps) async {
    await database.stepsDao.insertSteps(steps);
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
