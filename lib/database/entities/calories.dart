import 'package:intl/intl.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'Calories')
class Calories {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final DateTime date;
  final int dayOfTheWeek;
  final double burned;

  Calories(
      {this.id,
      required this.date,
      required this.burned,
      required this.dayOfTheWeek});

  static int _caloriesGoal(dayOfTheWeek) {
    switch (dayOfTheWeek) {
      case 1:
        return 2094;
      case 2:
        return 1910;
      case 3:
        return 2507;
      case 4:
        return 2160;
      case 5:
        return 2257;
      case 6:
        return 2035;
      case 7:
        return 1535;
      default:
        return 0;
    }
  }

  static int get caloriesBurnedGoal => 4500;

  int getCaloriesEaten() {
    return Calories._caloriesGoal(dayOfTheWeek);
  }

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