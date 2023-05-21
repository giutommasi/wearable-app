import 'package:intl/intl.dart';

class Sleep {
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final double duration;
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
        duration = num.parse(json["data"]["duration"]) as double,
        minutesAsleep = num.parse(json["data"]["minutesAsleep"]) as int,
        minutesAwake = num.parse(json["data"]["minutesAwake"]) as int,
        efficiency = num.parse(json["data"]["efficiency"]) as int;
}//Steps