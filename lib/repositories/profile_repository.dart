import 'package:pregnancy_health/database/database.dart';
import 'package:pregnancy_health/database/entities/profile.dart';
import 'package:flutter/material.dart';

class ProfileRepository extends ChangeNotifier {
  final AppDatabase database;

  ProfileRepository({required this.database});

  Profile? _profile;

  Future<Profile?> selectProfile(String profilename) async {
    final profile = await database.profileDao.findProfile(profilename);

    if (profile == null) {
      return null;
    }
    _profile = profile;
    notifyListeners();

    return profile;
  } //selectDay

  Profile get signedProfile => _profile!;

  //This method wraps the insertProfile() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insert(profile) async {
    await database.profileDao.insertProfile(profile);
    notifyListeners();
  } //insertProfile

  //This method wraps the deleteProfile() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> delete(profile) async {
    await database.profileDao.deleteProfile(profile);
    notifyListeners();
  } //removeProfile

  //This method wraps the updateProfile() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> update(profile) async {
    await database.profileDao.updateProfile(profile);
    notifyListeners();
  }
} //DatabaseRepository
