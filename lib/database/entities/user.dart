import 'package:floor/floor.dart';

@Entity(tableName: 'User', indices: [
  Index(value: ["username"], unique: true)
])
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String username;
  String password;

  User({this.id, required this.username, required this.password});
}//Steps