class DateUtils {
  static DateTime endOfCurrentDay() {
    final today = DateTime.now();
    final month = _twoDigits(today.month);
    final day = _twoDigits(today.day);
    String date = '${today.year}-$month-$day 23:59:59';
    return DateTime.parse(date);
  }

  static DateTime endOfCurrentYear() {
    final year = DateTime.now().year;
    String date = '$year-12-31 23:59:59';
    return DateTime.parse(date);
  }

  static DateTime endOfCurrentMonth() {
    final today = DateTime.now();
    final month = _twoDigits(today.month + 1);
    String nextMonthBeginString = '${today.year}-$month-01 23:59:59';
    final nextMonthBegin = DateTime.parse(nextMonthBeginString);
    return nextMonthBegin.add(Duration(days: -1));
  }

  static String _twoDigits (int num) {
    return num < 10 ? '0$num' : num.toString();
  }
}