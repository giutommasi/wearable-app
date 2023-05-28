import 'package:intl/intl.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'calories')
class Calories {
  
  @PrimaryKey(autoGenerate: true)
  int? id;
  final DateTime date;
  final int dayOfTheWeek;
  final double burned;
  double eaten = 0;

  Calories(
      {this.id, required this.date, required this.burned, required this.dayOfTheWeek});

  Calories.fromJson(Map<String, dynamic> json)
      : date = DateFormat('yyyy-MM-dd').parse('${json["date"]}'),
        dayOfTheWeek =
            DateFormat('yyyy-MM-dd').parse('${json["date"]}').weekday,
        // Calories is a double
        burned = num.parse(json["data"]
            .map((e) => num.parse(e["value"]))
            .toList() // List<int>
            .fold(0, (prev, element) => prev + element) // double
            .toStringAsFixed(2)) as double;

  @override
  String toString() {
    return 'Calories(time: $date, value: $burned)';
  } //toString
}//Calories