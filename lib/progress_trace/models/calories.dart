import 'package:intl/intl.dart';

class Calories {
  final DateTime date;
  final double calories;

  Calories({required this.date, required this.calories});

  Calories.fromJson(Map<String, dynamic> json)
      : date = DateFormat('yyyy-MM-dd').parse('${json["date"]}'),
        // Calories is a double
        calories = num.parse(json["data"]
            .map((e) => num.parse(e["value"]))
            .toList() // List<int>
            .fold(0, (prev, element) => prev + element) // double
            .toStringAsFixed(2)) as double;

  @override
  String toString() {
    return 'Calories(time: $date, value: $calories)';
  } //toString
}//Calories