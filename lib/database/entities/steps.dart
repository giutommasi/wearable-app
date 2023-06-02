import 'package:floor/floor.dart';
import 'package:intl/intl.dart';

@Entity(tableName: 'Steps')
class Steps {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final DateTime date;
  final int steps;

  Steps({this.id, required this.date, required this.steps});

  Steps.fromJson(Map<String, dynamic> json)
      : date = DateFormat('yyyy-MM-dd').parse('${json["date"]}'),
        // Steps is a double
        steps = json["data"]
            .map((e) => num.parse(e["value"]))
            .toList()
            .fold(0, (prev, element) => prev + element) as int;

  @override
  String toString() {
    return 'Steps(time: $date, value: $steps)';
  } //toString
}//Steps