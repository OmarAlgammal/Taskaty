import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constance/dimens.dart';
import 'dark_theme_colors.dart';


ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      color: DarkThemeColors.appBarColor,
      elevation: 0.0,
    ),
    dividerTheme: DividerThemeData(
      color: DarkThemeColors.dividerColor
    ),
    textTheme: const TextTheme(
      bodySmall:     TextStyle(color: DarkThemeColors.bodySmallColor),
      bodyMedium:    TextStyle(color: DarkThemeColors.bodySmallColor),
      bodyLarge:     TextStyle(color: DarkThemeColors.bodySmallColor),
      displaySmall:  TextStyle(color: DarkThemeColors.bodySmallColor),
      displayMedium: TextStyle(color: DarkThemeColors.bodySmallColor),
      displayLarge:  TextStyle(color: DarkThemeColors.bodySmallColor),
      titleSmall:    TextStyle(color: DarkThemeColors.bodySmallColor),
      titleMedium:   TextStyle(color: DarkThemeColors.bodySmallColor),
      titleLarge:    TextStyle(color: DarkThemeColors.bodySmallColor),
      headlineSmall:    TextStyle(color: DarkThemeColors.bodySmallColor),
      headlineMedium:    TextStyle(color: DarkThemeColors.bodySmallColor),
      headlineLarge:    TextStyle(color: DarkThemeColors.bodySmallColor),
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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: DarkThemeColors.bottomNavBackgroundColor,
      elevation: 0.0,
      showSelectedLabels: true,
      selectedItemColor: DarkThemeColors.bottomNavSelectedItemColor,
      type: BottomNavigationBarType.shifting,
    ),
    scaffoldBackgroundColor: DarkThemeColors.backgroundColor,

    colorScheme: const ColorScheme(
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
