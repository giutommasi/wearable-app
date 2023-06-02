// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StepsDao? _stepsDaoInstance;

  CaloriesDao? _caloriesDaoInstance;

  SleepDao? _sleepDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Steps` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` INTEGER NOT NULL, `steps` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Calories` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` INTEGER NOT NULL, `dayOfTheWeek` INTEGER NOT NULL, `burned` REAL NOT NULL, `eaten` REAL NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Sleep` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` INTEGER NOT NULL, `startTime` INTEGER NOT NULL, `endTime` INTEGER NOT NULL, `duration` INTEGER NOT NULL, `minutesAsleep` INTEGER NOT NULL, `minutesAwake` INTEGER NOT NULL, `efficiency` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StepsDao get stepsDao {
    return _stepsDaoInstance ??= _$StepsDao(database, changeListener);
  }

  @override
  CaloriesDao get caloriesDao {
    return _caloriesDaoInstance ??= _$CaloriesDao(database, changeListener);
  }

  @override
  SleepDao get sleepDao {
    return _sleepDaoInstance ??= _$SleepDao(database, changeListener);
  }
}

class _$StepsDao extends StepsDao {
  _$StepsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _stepsInsertionAdapter = InsertionAdapter(
            database,
            'Steps',
            (Steps item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'steps': item.steps
                }),
        _stepsUpdateAdapter = UpdateAdapter(
            database,
            'Steps',
            ['id'],
            (Steps item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'steps': item.steps
                }),
        _stepsDeletionAdapter = DeletionAdapter(
            database,
            'Steps',
            ['id'],
            (Steps item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'steps': item.steps
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Steps> _stepsInsertionAdapter;

  final UpdateAdapter<Steps> _stepsUpdateAdapter;

  final DeletionAdapter<Steps> _stepsDeletionAdapter;

  @override
  Future<List<Steps>> findAllSteps() async {
    return _queryAdapter.queryList('SELECT * FROM Steps',
        mapper: (Map<String, Object?> row) => Steps(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            steps: row['steps'] as int));
  }

  @override
  Future<void> insertSteps(Steps steps) async {
    await _stepsInsertionAdapter.insert(steps, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSteps(Steps steps) async {
    await _stepsUpdateAdapter.update(steps, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteSteps(Steps steps) async {
    await _stepsDeletionAdapter.delete(steps);
  }
}

class _$CaloriesDao extends CaloriesDao {
  _$CaloriesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _caloriesInsertionAdapter = InsertionAdapter(
            database,
            'Calories',
            (Calories item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'dayOfTheWeek': item.dayOfTheWeek,
                  'burned': item.burned,
                  'eaten': item.eaten
                }),
        _caloriesUpdateAdapter = UpdateAdapter(
            database,
            'Calories',
            ['id'],
            (Calories item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'dayOfTheWeek': item.dayOfTheWeek,
                  'burned': item.burned,
                  'eaten': item.eaten
                }),
        _caloriesDeletionAdapter = DeletionAdapter(
            database,
            'Calories',
            ['id'],
            (Calories item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'dayOfTheWeek': item.dayOfTheWeek,
                  'burned': item.burned,
                  'eaten': item.eaten
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Calories> _caloriesInsertionAdapter;

  final UpdateAdapter<Calories> _caloriesUpdateAdapter;

  final DeletionAdapter<Calories> _caloriesDeletionAdapter;

  @override
  Future<List<Calories>> findAllCalories() async {
    return _queryAdapter.queryList('SELECT * FROM Calories',
        mapper: (Map<String, Object?> row) => Calories(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            burned: row['burned'] as double,
            dayOfTheWeek: row['dayOfTheWeek'] as int));
  }

  @override
  Future<void> insertCalories(Calories calories) async {
    await _caloriesInsertionAdapter.insert(calories, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCalories(Calories calories) async {
    await _caloriesUpdateAdapter.update(calories, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteCalories(Calories calories) async {
    await _caloriesDeletionAdapter.delete(calories);
  }
}

class _$SleepDao extends SleepDao {
  _$SleepDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _sleepInsertionAdapter = InsertionAdapter(
            database,
            'Sleep',
            (Sleep item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'startTime': _dateTimeConverter.encode(item.startTime),
                  'endTime': _dateTimeConverter.encode(item.endTime),
                  'duration': item.duration,
                  'minutesAsleep': item.minutesAsleep,
                  'minutesAwake': item.minutesAwake,
                  'efficiency': item.efficiency
                }),
        _sleepUpdateAdapter = UpdateAdapter(
            database,
            'Sleep',
            ['id'],
            (Sleep item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'startTime': _dateTimeConverter.encode(item.startTime),
                  'endTime': _dateTimeConverter.encode(item.endTime),
                  'duration': item.duration,
                  'minutesAsleep': item.minutesAsleep,
                  'minutesAwake': item.minutesAwake,
                  'efficiency': item.efficiency
                }),
        _sleepDeletionAdapter = DeletionAdapter(
            database,
            'Sleep',
            ['id'],
            (Sleep item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'startTime': _dateTimeConverter.encode(item.startTime),
                  'endTime': _dateTimeConverter.encode(item.endTime),
                  'duration': item.duration,
                  'minutesAsleep': item.minutesAsleep,
                  'minutesAwake': item.minutesAwake,
                  'efficiency': item.efficiency
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Sleep> _sleepInsertionAdapter;

  final UpdateAdapter<Sleep> _sleepUpdateAdapter;

  final DeletionAdapter<Sleep> _sleepDeletionAdapter;

  @override
  Future<List<Sleep>> findAllSleep() async {
    return _queryAdapter.queryList('SELECT * FROM Sleep',
        mapper: (Map<String, Object?> row) => Sleep(
            startTime: _dateTimeConverter.decode(row['startTime'] as int),
            endTime: _dateTimeConverter.decode(row['endTime'] as int),
            minutesAsleep: row['minutesAsleep'] as int,
            minutesAwake: row['minutesAwake'] as int,
            efficiency: row['efficiency'] as int,
            date: _dateTimeConverter.decode(row['date'] as int),
            duration: row['duration'] as int));
  }

  @override
  Future<void> insertSleep(Sleep sleep) async {
    await _sleepInsertionAdapter.insert(sleep, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSleep(Sleep sleep) async {
    await _sleepUpdateAdapter.update(sleep, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteSleep(Sleep sleep) async {
    await _sleepDeletionAdapter.delete(sleep);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
