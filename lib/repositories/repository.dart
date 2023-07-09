import 'package:pregnancy_health/database/database.dart';

abstract class Repository<T> {
  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  Repository(this.database);

  Future<List<T>> loadAll();

  Future<T> selectDay(DateTime day);

  Future<void> insert(T entity);
  Future<void> insertAll(List<T> entity);

  Future<void> delete(T entity);

  Future<void> update(T entity);
}
