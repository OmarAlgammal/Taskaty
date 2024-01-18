import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constance/border_radius.dart';
import '../../../utils/constance/dimens.dart';
import '../colors.dart';

ThemeData lightTheme = ThemeData(

  tabBarTheme: const TabBarTheme(
    labelColor: LightThemeColors.onPrimaryColor,
    unselectedLabelColor: LightThemeColors.onSurfaceColor,
    indicator: BoxDecoration(
      color: LightThemeColors.primaryColor,
      borderRadius: Circular.circular16,
    ),
  ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: LightThemeColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: LightThemeColors.primaryColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      color: LightThemeColors.appBarColor,
      elevation: 0.0,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(padding8,),
        iconSize: MaterialStateProperty.all(18.0),
        iconColor: MaterialStateProperty.all(LightThemeColors.primaryColor)
      )
      /// TODO: Complete icon button theem
    ),
    iconTheme: const IconThemeData(
      color: LightThemeColors.onPrimaryColor,
    ),
    primaryIconTheme: const IconThemeData(
      color: LightThemeColors.primaryColor,
    ),
    scaffoldBackgroundColor: LightThemeColors.backgroundColor,
    colorScheme: ColorScheme(
      background: LightThemeColors.backgroundColor,
      onBackground: LightThemeColors.onBackgroundColor,
      brightness: Brightness.light,
      primary: LightThemeColors.primaryColor,
      onPrimary: LightThemeColors.onPrimaryColor,
      error: LightThemeColors.errorColor,
      onError: LightThemeColors.onErrorColor,
      secondary: LightThemeColors.secondaryColor,
      onSecondary: LightThemeColors.onSecondaryColor,
      surface: LightThemeColors.surfaceColor,
      onSurface: LightThemeColors.onSurfaceColor,
    ));

class LightThemeColors {
  LightThemeColors._();

  static const appBarColor = AppColors.transparentColor;

  static const iconColor = AppColors.blackColor;

  static const primaryColor = AppColors.greenColor;
  static const Color onPrimaryColor = AppColors.blackColor;

  static const errorColor = AppColors.redColor;
  static const onErrorColor = AppColors.redColor;

  static final secondaryColor = AppColors.brightGreenColor;
  static final onSecondaryColor = AppColors.brightGreenColor;

  static const backgroundColor = AppColors.whiteColor;
  static const onBackgroundColor = AppColors.whiteColor;

  static const surfaceColor = AppColors.brightGreyColor;
  static const onSurfaceColor = AppColors.greyColor;
}