import 'package:intl/intl.dart';

import '../../utils/date_utils.dart';

class Sleep {
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
            '${json["date"].split("-")[0]}-${json["data"]["startTime"]}'),
        endTime = DateFormat('yyyy-MM-dd HH:mm:ss')
            .parse('${json["date"].split("-")[0]}-${json["data"]["endTime"]}'),
        duration = json["data"]["duration"] / 1000 as int,
        minutesAsleep = json["data"]["minutesAsleep"],
        minutesAwake = json["data"]["minutesAwake"],
        efficiency = json["data"]["efficiency"];

  @override
  String toString() {
    return 'Sleep(time: ${DateUtils.dateOnly(date)}, value: $startTime $endTime $efficiency $duration $minutesAsleep $minutesAwake)';
  } //toString
}//Sleep