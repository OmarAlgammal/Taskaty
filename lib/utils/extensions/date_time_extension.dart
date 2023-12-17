import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  bool get likeToday {
    final now = DateTime.now();
    if (year == now.year && month == now.month && day == now.day) {
      return true;
    }
    return false;
  }

  bool get likeThisYear => year == DateTime.now().year;

  int get getWeekNumberInMonth => (day / 7).ceil();

  String get myDateFormat => DateFormat('yyyy/MM/dd').format(this);

  int get daysInMonth {
    // Construct a DateTime object for the first day of the next month
    DateTime firstDayOfNextMonth = DateTime(year, month + 1, 1);

    // Subtract one day to get the last day of the current month
    DateTime lastDayOfCurrentMonth =
        firstDayOfNextMonth.subtract(Duration(days: 1));

    // Extract and return the day component of the last day of the month
    return lastDayOfCurrentMonth.day;
  }

  String get myDateFormatWithHours => DateFormat('dd/MM/yyyy HH:mm').format(this);

  bool get isBeforeToday => isBefore(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  String get dateZone {
    final year = DateTime.now().year;
    final month = DateTime.now().month;
    final day = DateTime.now().day;

    final thisDate = DateTime(this.year, this.month, this.day);

    final beforeTwoDaysDate = DateTime(year, month, day - 2);
    final yesterdayDate = DateTime(year, month, day - 1);
    final todayDate = DateTime(year, month, day);
    final tomorrowDate = DateTime(year, month, day + 1);
    final afterTwoDaysDate = DateTime(year, month, day + 2);

    if (thisDate.isAtSameMomentAs(beforeTwoDaysDate)) {
      return '2 days ago';
    }
    if (thisDate.isAtSameMomentAs(yesterdayDate)) {
      return 'yesterday';
    }
    if (thisDate.isAtSameMomentAs(todayDate)) {
      return 'today';
    }
    if (thisDate.isAtSameMomentAs(tomorrowDate)) {
      return 'tomorrow';
    }
    if (thisDate.isAtSameMomentAs(afterTwoDaysDate)) {
      return 'After 2 days';
    }

    return DateFormat('MMM d').format(this);
  }
}
