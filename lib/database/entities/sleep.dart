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
  final int duration; // seconds
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

  static int maxGoal = 8;

  Sleep.fromJson(DateTime day, Map<String, dynamic> json)
      : date = day,
        startTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(
            '${DateFormat('yyyy-MM-dd').format(day).split("-")[0]}-${json["startTime"]}'),
        endTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(
            '${DateFormat('yyyy-MM-dd').format(day).split("-")[0]}-${json["endTime"]}'),
        duration = json["duration"] ~/ 1000,
        minutesAsleep = json["minutesAsleep"],
        minutesAwake = json["minutesAwake"],
        efficiency = json["efficiency"];

  @override
  String toString() {
    return 'Sleep(time: ${DateUtils.dateOnly(date)}, value: $startTime $endTime $efficiency $duration $minutesAsleep $minutesAwake)';
  } //toString
}//Sleep