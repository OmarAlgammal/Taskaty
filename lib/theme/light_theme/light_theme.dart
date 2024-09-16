import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constance/border_radius.dart';
import '../../../utils/constance/my_padding.dart';
import '../colors.dart';
import '../colors.dart';

final lightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ThemeData.light().scaffoldBackgroundColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(color: AppColors.greyColor),
    iconTheme: IconThemeData(color: AppColors.blackColor),
    actionsIconTheme: IconThemeData(
        color: AppColors.greyColor
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: AppColors.redColor,
    unselectedLabelColor: Colors.green,
    dividerColor: AppColors.brightGreyColor,
    indicatorColor: AppColors.greyColor,
  ),
  primaryColor: AppColors.greyColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.greyColor,
  ),
  colorScheme: ThemeData.light().colorScheme.copyWith(
    primary: AppColors.greyColor,
    primaryContainer: AppColors.brightGreyColor,
    onPrimary: AppColors.whiteColor,
  ),

);

// final darkTheme = ThemeData.dark().copyWith(
//   floatingActionButtonTheme:
//   FloatingActionButtonThemeData(backgroundColor: AppColors.greyColor),
//   primaryColor: AppColors.whiteColor,
//
//   colorScheme: ThemeData.dark().colorScheme.copyWith(
//       background: AppColors.blackColor,
//       primary: AppColors.greyColor,
//       primaryContainer: AppColors.brightGreyColor,
//       onPrimary: AppColors.whiteColor),
//   tabBarTheme: const TabBarTheme(
//     labelColor: AppColors.greyColor,
//     unselectedLabelColor: AppColors.greyColor,
//     indicator: BoxDecoration(
//       color: AppColors.whiteColor,
//       borderRadius: Circular.circular16,
//     ),
//
//   ),
// );

