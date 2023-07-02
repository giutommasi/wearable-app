import 'package:floor/floor.dart';

@Entity(tableName: 'User', indices: [
  Index(value: ["username"], unique: true)
])
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String username;
  final String firstName;
  final String lastName;
  final String password;

  User(
      {this.id,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.password});
}//Steps