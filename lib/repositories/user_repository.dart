import 'package:pregnancy_health/database/database.dart';
import 'package:pregnancy_health/database/entities/user.dart';
import 'package:flutter/material.dart';

class UserRepository extends ChangeNotifier {
  final AppDatabase database;

  UserRepository({required this.database});

  User? _user;

  Future<User?> selectUser(String username, String hashedPwd) async {
    final user = await database.userDao.selectUser(username, hashedPwd);

    if (user == null) {
      return null;
    }
    _user = user;
    notifyListeners();

    return user;
  } //selectDay

  Future<bool> selectSignedUser(String username) async {
    final user = await database.userDao.selectSignedUser(username);

    if (user == null) {
      return false;
    }
    _user = user;
    notifyListeners();

    return true;
  } //selectDay

  Future<int> countUser(String username) async {
    final users = await database.userDao.countUser(username);

    if (users == null) {
      return 0;
    }

    return users;
  } //selectDay

  User get signedUser => _user!;

  //This method wraps the insertUser() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insert(user) async {
    await database.userDao.insertUser(user);
    notifyListeners();
  } //insertUser

  //This method wraps the deleteUser() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> delete(user) async {
    await database.userDao.deleteUser(user);
    notifyListeners();
  } //removeUser

  //This method wraps the updateUser() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> update(user) async {
    await database.userDao.updateUser(user);
    notifyListeners();
  }
} //DatabaseRepository
