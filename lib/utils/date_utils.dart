import 'package:intl/intl.dart';

class DateUtils {
  static String dateOnly(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }
}
