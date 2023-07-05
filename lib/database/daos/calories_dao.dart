import 'package:floor/floor.dart';

import '../entities/calories.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class CaloriesDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Calories table
  @Query('SELECT * FROM Calories')
  Future<List<Calories>> findAllCalories();

  //Query #2: INSERT -> this allows to add a Calories in the table
  @insert
  Future<void> insertCalories(Calories calories);

  //Query #3: DELETE -> this allows to delete a Calories entry from the table
  @delete
  Future<void> deleteCalories(Calories calories);

  //Query #4: UPDATE -> this allows to update a Calories entry
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateCalories(Calories calories);

  //Query #5: INSERT -> this allows to add all Steps in the table
  @insert
  Future<void> insertAllCalories(List<Calories> steps);

  //Query #6: SELECT -> this allows to obtain all the entries of the Calories table
  @Query('SELECT * FROM Calories WHERE date = :day')
  Future<List<Calories>> findCalories(DateTime day);
}//CaloriesDao