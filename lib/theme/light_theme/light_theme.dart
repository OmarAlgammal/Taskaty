import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';

final lightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ThemeData.light().scaffoldBackgroundColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(color: AppColors.blueColor),
    iconTheme: IconThemeData(color: AppColors.blackColor),
    actionsIconTheme: IconThemeData(
      color: AppColors.blueColor,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: AppColors.redColor,
    unselectedLabelColor: Colors.green,
    dividerColor: AppColors.brightGreyColor,
    indicatorColor: AppColors.blueColor,
  ),
  primaryColor: AppColors.blueColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.blueColor,
  ),
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: AppColors.blueColor,
        primaryContainer: AppColors.brightGreyColor,
        onPrimary: AppColors.whiteColor,
      ),
);

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
