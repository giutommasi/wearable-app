class Calories {
  String? hours;
  String? minutes;
  String? seconds;
  double? _calories;

  Calories(double calories, String time) {
    _calories = calories;
    List<String> times = time.split(':');

    hours = times[0];
    minutes = times[1];
    seconds = times[2];
  }

  double get steps {
    return _calories!;
  }

  String get timestamp {
    return '$hours:$minutes';
  }
}
