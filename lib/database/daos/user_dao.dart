import 'package:floor/floor.dart';

import '../entities/user.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class UserDao {
  //Query #1: INSERT -> this allows to add a Steps in the table
  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertUser(User user);

  //Query #3: DELETE -> this allows to delete a Steps entry from the table
  @delete
  Future<void> deleteUser(User user);

  //Query #4: UPDATE -> this allows to update a Steps entry
  @Update(onConflict: OnConflictStrategy.rollback)
  Future<void> updateUser(User user);

  //Query #6: SELECT -> this allows to obtain all the entries of the Sleep table
  @Query('SELECT COUNT(*) FROM User WHERE username = :username')
  Future<int?> countUser(String username);

  //Query #6: SELECT -> this allows to obtain all the entries of the Sleep table
  @Query(
      'SELECT * FROM User WHERE username = :username AND password = :password limit 1')
  Future<User?> selectUser(String username, String password);

  @Query('SELECT * FROM User WHERE username = :username limit 1')
  Future<User?> selectSignedUser(String username);
}//StepsDao