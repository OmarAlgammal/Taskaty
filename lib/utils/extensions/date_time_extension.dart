import 'package:flutter/cupertino.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl/intl.dart';
import 'package:taskaty/localization/app_local.dart';

extension DateTimeExtension on DateTime {
  bool get likeToday {
    final now = DateTime.now();
    if (year == now.year && month == now.month && day == now.day) {
      return true;
    }
    return false;
  }

  bool get isAfterNow => isAfter(DateTime.now());

  bool get likeThisYear => year == DateTime.now().year;

  int get getWeekNumberInMonth => (day / 7).ceil();

  String get myDateFormat => DateFormat('yyyy/MM/dd').format(this);

  int get daysInMonth {
    // Construct a DateTime object for the first day of the next month
    DateTime firstDayOfNextMonth = DateTime(year, month + 1, 1);

    // Subtract one day to get the last day of the current month
    DateTime lastDayOfCurrentMonth =
        firstDayOfNextMonth.subtract(const Duration(days: 1));

    // Extract and return the day component of the last day of the month
    return lastDayOfCurrentMonth.day;
  }

  String get myDateFormatWithHours =>
      DateFormat('dd/MM/yyyy HH:mm').format(this);

  bool get isBeforeToday => isBefore(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  String dateZone(BuildContext context) {
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
      return '2 ${AppLocal.daysAgo.getString(context)}';
    }
    if (thisDate.isAtSameMomentAs(yesterdayDate)) {
      return AppLocal.yesterday.getString(context);
    }
    if (thisDate.isAtSameMomentAs(todayDate)) {
      return AppLocal.today.getString(context);
    }
    if (thisDate.isAtSameMomentAs(tomorrowDate)) {
      return AppLocal.tomorrow.getString(context);
    }
    if (thisDate.isAtSameMomentAs(afterTwoDaysDate)) {
      return '${AppLocal.after.getString(context)} 2 ${AppLocal.days.getString(context)}';
    }

    return DateFormat('MMM d').format(this);
  }
}
