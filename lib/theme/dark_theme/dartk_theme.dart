import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constance/dimens.dart';
import '../../utils/constance/border_radius.dart';
import '../colors.dart';

ThemeData darkTheme = ThemeData(
    tabBarTheme: const TabBarTheme(
      labelColor: DarkThemeColors.onPrimaryColor,
      unselectedLabelColor: DarkThemeColors.onSurfaceColor,
      indicator: BoxDecoration(
        color: DarkThemeColors.surfaceColor,
        borderRadius: Circular.circular16,
      ),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      color: DarkThemeColors.appBarColor,
      elevation: 0.0,
    ),
    dividerTheme: const DividerThemeData(color: DarkThemeColors.dividerColor),
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: DarkThemeColors.bodySmallColor),
      bodyMedium: TextStyle(color: DarkThemeColors.bodySmallColor),
      bodyLarge: TextStyle(color: DarkThemeColors.bodySmallColor),
      displaySmall: TextStyle(color: DarkThemeColors.bodySmallColor),
      displayMedium: TextStyle(color: DarkThemeColors.bodySmallColor),
      displayLarge: TextStyle(color: DarkThemeColors.bodySmallColor),
      titleSmall: TextStyle(color: DarkThemeColors.bodySmallColor),
      titleMedium: TextStyle(color: DarkThemeColors.bodySmallColor),
      titleLarge: TextStyle(color: DarkThemeColors.bodySmallColor),
      headlineSmall: TextStyle(color: DarkThemeColors.bodySmallColor),
      headlineMedium: TextStyle(color: DarkThemeColors.bodySmallColor),
      headlineLarge: TextStyle(color: DarkThemeColors.bodySmallColor),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
              padding8,
            ),
            iconSize: MaterialStateProperty.all(18.0),
            iconColor: MaterialStateProperty.all(DarkThemeColors.iconColor))

        /// TODO: Complete icon button theme
        ),
    iconTheme: const IconThemeData(
      color: DarkThemeColors.primaryColor,
    ),
    primaryIconTheme: const IconThemeData(
      color: DarkThemeColors.primaryColor,
    ),
    scaffoldBackgroundColor: DarkThemeColors.backgroundColor,
    colorScheme: ColorScheme(
      background: DarkThemeColors.backgroundColor,
      onBackground: DarkThemeColors.onBackgroundColor,
      brightness: Brightness.light,
      primary: DarkThemeColors.primaryColor,
      onPrimary: DarkThemeColors.onPrimaryColor,
      error: DarkThemeColors.errorColor,
      onError: DarkThemeColors.onErrorColor,
      secondary: DarkThemeColors.secondaryColor,
      onSecondary: DarkThemeColors.onSecondaryColor,
      surface: DarkThemeColors.surfaceColor,
      onSurface: DarkThemeColors.onSurfaceColor,
    ));

class DarkThemeColors {
  DarkThemeColors._();

  static const appBarColor = AppColors.transparentColor;

  static const iconColor = AppColors.blackColor;

  static const primaryColor = AppColors.whiteColor;
  static const onPrimaryColor = AppColors.whiteColor;

  static const errorColor = AppColors.redColor;
  static const onErrorColor = AppColors.redColor;

  static final secondaryColor = AppColors.brightGreenColor;
  static final onSecondaryColor = AppColors.brightGreenColor;

  static const backgroundColor = AppColors.blackColor;
  static const onBackgroundColor = AppColors.blackColor;

  static const surfaceColor = AppColors.greyColor;
  static const onSurfaceColor = AppColors.brightGreyColor;

  static const bodySmallColor = AppColors.whiteColor;
  static const bodyMediumColorColor = AppColors.whiteColor;
  static const bodyLargeColorColor = AppColors.whiteColor;
  static const displaySmallColor = AppColors.whiteColor;
  static const displayMediumColor = AppColors.whiteColor;
  static const displayLargeColor = AppColors.whiteColor;
  static const titleSmallColor = AppColors.whiteColor;
  static const titleMediumColor = AppColors.whiteColor;
  static const titleLargeColor = AppColors.whiteColor;

  static const dividerColor = AppColors.whiteColor;
}
