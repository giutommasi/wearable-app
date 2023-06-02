import 'package:exam/database/database.dart';
import 'package:flutter/material.dart';

abstract class Repository<T> extends ChangeNotifier {
  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  Repository(this.database);

  Future<List<T>> selectAll();

  Future<T> selectDay(DateTime day);

  Future<void> insert(T entity);

  Future<void> delete(T entity);

  Future<void> update(T entity);
}
