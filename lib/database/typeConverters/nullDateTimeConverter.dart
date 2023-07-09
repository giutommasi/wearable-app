import 'package:floor/floor.dart';

class NullDateTimeConverter extends TypeConverter<DateTime?, int?> {
  @override
  DateTime? decode(int? databaseValue) {
    if (databaseValue == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(databaseValue);
  } //decode

  @override
  int? encode(DateTime? value) {
    if (value == null) return null;
    return value.millisecondsSinceEpoch;
  } //encode
}//DateTimeConverter