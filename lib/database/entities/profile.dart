import 'package:pregnancy_health/database/entities/user.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'Profile', foreignKeys: [
  ForeignKey(
      childColumns: ['profile_username'],
      parentColumns: ['username'],
      entity: User)
])
class Profile {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String firstName;
  String lastName;
  @ColumnInfo(name: 'profile_username')
  final String profileUsername;
  String? childName;
  int? pregnantWeek;
  DateTime? birthday;
  DateTime timestamp;

  int get actualWeek =>
      pregnantWeek! + (DateTime.now().difference(timestamp).inDays ~/ 7);

  Profile(
      {this.id,
      required this.profileUsername,
      required this.firstName,
      required this.lastName,
      this.pregnantWeek,
      this.birthday,
      this.childName,
      required this.timestamp});
}//Steps