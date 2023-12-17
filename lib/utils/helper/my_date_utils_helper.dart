import 'package:taskaty/utils/extensions/date_time_extension.dart';

class MyDateUtilsHelper {
  static bool afterThisMonth(int monthNum) =>
      DateTime(DateTime.now().year, monthNum).isAfter(DateTime.now());

  static bool beforeThisMonth(int monthNum) =>
      DateTime(DateTime.now().year, monthNum).isBefore(DateTime.now());

  static bool inThisMonth(int monthNum) => DateTime.now().month == monthNum;

  static bool fromThePastMonths(int monthNum) =>
      DateTime.now().month > monthNum;

  static bool fromTheNextMonths(int monthNum) =>
      DateTime.now().month < monthNum;

  static bool thisMonthOrLater(int monthNum) =>
      inThisMonth(monthNum) || afterThisMonth(monthNum);

  static DateTime createCreationDate(int? monthNum, int? weekNum) {
    final dateNow = DateTime.now();
    final year = dateNow.year;
    final month = dateNow.month;
    final week = weekNumInMonth();
    final day = dateNow.day;
    // Created in month
    if (monthNum != null && weekNum == null) {
      if (monthNum > month) {
        return DateTime(
          year,
          monthNum,
        );
      }
      if (monthNum == month) {
        return DateTime(year, month, day);
      }
      return dateNow;
    }
    // Created in week
    if (monthNum != null && weekNum != null) {
      if (month == monthNum && week == weekNum) {
        return DateTime.now();
      }
      final dayInMonth = weekNum * 7 > getMonthDays(monthNum)
          ? getMonthDays(monthNum)
          : weekNum * 7;
      return DateTime(year, monthNum, dayInMonth);
    }

    return DateTime.now();
  }

  static bool thisWeekOrLater(int monthNum, int weekNum) {
    final currentMonthNum = DateTime.now().month;
    final currentDayInMonth = DateTime.now().day;
    if (currentMonthNum < monthNum) return true;
    if (currentMonthNum == monthNum) {
      return weekNum >= (currentDayInMonth / 7).ceil();
    }
    return false;
  }

  static bool inThisWeek({required int monthNum, required int weekNum}) {
    return DateTime.now().month == monthNum && weekNumInMonth() == weekNum;
  }

  static int getMonthDays(int? monthNum) {
    if (monthNum == null) {
      return DateTime.now().daysInMonth;
    }
    return DateTime(DateTime.now().year, monthNum).daysInMonth;
  }

  static int weekNumInMonth({DateTime? date}) {
    int dayOfMonth = date != null ? date.day : DateTime.now().day;
    return (dayOfMonth / 7).ceil();
  }
}
