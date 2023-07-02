//Imports that are necessary to the code generator of floor
import 'dart:async';

import 'package:exam/database/daos/sleep_dao.dart';
import 'package:exam/database/daos/steps_dao.dart';
import 'package:exam/database/daos/user_dao.dart';
import 'package:exam/database/typeConverters/dateTimeConverter.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

//Here, we are importing the entities and the daos of the database
import 'package:exam/database/entities/steps.dart';
import 'package:exam/database/entities/calories.dart';
import 'package:exam/database/entities/sleep.dart';

import 'daos/calories_dao.dart';
import 'entities/user.dart';
//The generated code will be in database.g.dart
part 'database.g.dart';

//Here we are saying that this is the first version of the Database and it has just 1 entity, i.e., Meal.
//We also added a TypeConverter to manage the DateTime of a Meal entry, since DateTimes are not natively
//supported by Floor.
@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Steps, Calories, Sleep, User])
abstract class AppDatabase extends FloorDatabase {
  //Add all the daos as getters here
  StepsDao get stepsDao;
  CaloriesDao get caloriesDao;
  SleepDao get sleepDao;
  UserDao get userDao;
}//AppDatabase