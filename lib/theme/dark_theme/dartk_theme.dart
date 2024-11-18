import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';

final darkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.blackColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: AppColors.blueColor),
  primaryColor: AppColors.whiteColor,
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        surface: AppColors.blackColor,
        primary: AppColors.blueColor,
        primaryContainer: AppColors.brightGreyColor,
        onPrimary: AppColors.whiteColor,
      ),

);
