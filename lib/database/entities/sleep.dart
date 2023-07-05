import 'package:floor/floor.dart';
import 'package:intl/intl.dart';

import '../../utils/date_utils.dart';

@Entity(tableName: 'Sleep')
class Sleep {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final int duration; // minutes
  final int minutesAsleep;
  final int minutesAwake;
  final int efficiency;

  Sleep(
      {required this.startTime,
      required this.endTime,
      required this.minutesAsleep,
      required this.minutesAwake,
      required this.efficiency,
      required this.date,
      required this.duration});

  Sleep.fromJson(Map<String, dynamic> json)
      : date = DateFormat('yyyy-MM-dd').parse('${json["date"]}'),
        startTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(
            '${json["date"].split("-")[0]}-${json["data"][0]["startTime"]}'),
        endTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(
            '${json["date"].split("-")[0]}-${json["data"][0]["endTime"]}'),
        duration = json["data"][0]["duration"] ~/ 1000,
        minutesAsleep = json["data"][0]["minutesAsleep"],
        minutesAwake = json["data"][0]["minutesAwake"],
        efficiency = json["data"][0]["efficiency"];

  @override
  String toString() {
    return 'Sleep(time: ${DateUtils.dateOnly(date)}, value: $startTime $endTime $efficiency $duration $minutesAsleep $minutesAwake)';
  } //toString
}//Sleep