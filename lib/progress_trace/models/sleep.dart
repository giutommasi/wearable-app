import 'package:intl/intl.dart';

class Sleep {
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final int duration;
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
        startTime =
            DateFormat('MM-dd HH:mm:ss').parse('${json["data"]["startTime"]}'),
        endTime =
            DateFormat('MM-dd HH:mm:ss').parse('${json["data"]["endTime"]}'),
        // Steps is a double
        duration = json["data"]["duration"],
        minutesAsleep = json["data"]["minutesAsleep"],
        minutesAwake = json["data"]["minutesAwake"],
        efficiency = json["data"]["efficiency"];

  @override
  String toString() {
    return 'Calories(time: $date, value: $startTime $endTime $efficiency $date $duration $minutesAsleep $minutesAwake)';
  } //toString
}//Steps