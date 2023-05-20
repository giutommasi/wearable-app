class Step {
  String? hours;
  String? minutes;
  String? seconds;
  int? _steps;

  Step(int steps, String time) {
    _steps = steps;
    List<String> times = time.split(':');

    hours = times[0];
    minutes = times[1];
    seconds = times[2];
  }

  int get steps {
    return _steps!;
  }

  String get timestamp {
    return '$hours:$minutes';
  }
}
