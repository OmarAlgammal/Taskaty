import 'package:flutter/cupertino.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';

class MainTabsValues {
  MainTabsValues._();

  static String today(BuildContext context) => AppLocal.today.getString(context);
  static String weekly(BuildContext context) => AppLocal.weekly.getString(context);
  static String monthly(BuildContext context) => AppLocal.monthly.getString(context);
  static String all(BuildContext context) => AppLocal.all.getString(context);

  static List<String> mainValues(BuildContext context) =>
      [
        AppLocal.today.getString(context),
        AppLocal.weekly.getString(context),
        AppLocal.monthly.getString(context),
        AppLocal.all.getString(context),
      ];

}