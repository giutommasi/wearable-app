import 'package:floor/floor.dart';

import '../entities/sleep.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class SleepDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Sleep table
  @Query('SELECT * FROM Sleep')
  Future<List<Sleep>> findAllSleep();

  //Query #2: INSERT -> this allows to add a Sleep in the table
  @insert
  Future<void> insertSleep(Sleep sleep);

  //Query #3: DELETE -> this allows to delete a Sleep entry from the table
  @delete
  Future<void> deleteSleep(Sleep sleep);

  //Query #4: UPDATE -> this allows to update a Sleep entry
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateSleep(Sleep sleep);

  //Query #5: INSERT -> this allows to add all Steps in the table
  @insert
  Future<void> insertAllSleep(List<Sleep> sleep);

  //Query #6: SELECT -> this allows to obtain all the entries of the Sleep table
  @Query('SELECT * FROM Sleep WHERE date = :day')
  Future<List<Sleep>> findSleep(DateTime day);
}//SleepDao