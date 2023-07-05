import 'package:floor/floor.dart';

import '../entities/profile.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class ProfileDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Profile table
  @Query('SELECT * FROM Profile')
  Future<List<Profile>> findAllProfile();

  //Query #2: INSERT -> this allows to add a Profile in the table
  @insert
  Future<void> insertProfile(Profile profile);

  //Query #3: DELETE -> this allows to delete a Profile entry from the table
  @delete
  Future<void> deleteProfile(Profile profile);

  //Query #4: UPDATE -> this allows to update a Profile entry
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateProfile(Profile profile);

  //Query #5: SELECT -> this allows to obtain all the entries of the Sleep table
  @Query('SELECT * FROM Profile WHERE profile_username = :username LIMIT 1')
  Future<Profile?> findProfile(String username);
}//ProfileDao