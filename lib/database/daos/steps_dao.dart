import 'package:floor/floor.dart';

import '../entities/steps.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class StepsDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Steps table
  @Query('SELECT * FROM Steps WHERE date >= :start AND date <= :end')
  Future<List<Steps>> findAllSteps(DateTime start, DateTime end);

  //Query #2: INSERT -> this allows to add a Steps in the table
  @insert
  Future<void> insertSteps(Steps steps);

  //Query #3: DELETE -> this allows to delete a Steps entry from the table
  @delete
  Future<void> deleteSteps(Steps steps);

  //Query #4: UPDATE -> this allows to update a Steps entry
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateSteps(Steps steps);

  //Query #5: INSERT -> this allows to add all Steps in the table
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllSteps(List<Steps> steps);

  //Query #6: SELECT -> this allows to obtain all the entries of the Sleep table
  @Query('SELECT * FROM Steps WHERE date = :day')
  Future<List<Steps>> findSteps(DateTime day);
}//StepsDao