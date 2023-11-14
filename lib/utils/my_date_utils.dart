import 'package:easy_localization/easy_localization.dart';

class MyDateUtils {

  static String getMonthAbbreviatedName(int monthNum) =>
      DateFormat('MMM').format(DateTime(DateTime
          .now()
          .year, monthNum));

  static bool afterThisMonth(int monthNum) =>
      DateTime(DateTime
          .now()
          .year, monthNum).isAfter(DateTime.now());

  static bool beforeThisMonth(int monthNum) => DateTime(DateTime.now().year, monthNum).isBefore(DateTime.now());

  static bool inThisMonth(int monthNum) => DateTime.now().month == monthNum;

}