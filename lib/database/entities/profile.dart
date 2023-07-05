import 'package:exam/database/entities/user.dart';
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
  @ColumnInfo(name: 'profile_username')
  final String profileUsername;
  int? pregnantWeek;
  DateTime? birthday;

  Profile(
      {this.id,
      required this.profileUsername,
      this.pregnantWeek,
      this.birthday});
}//Steps