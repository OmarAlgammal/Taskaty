import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constance/border_radius.dart';
import '../colors.dart';

final darkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.blackColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.red,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: AppColors.greyColor),
  primaryColor: AppColors.whiteColor,

  colorScheme: ThemeData.dark().colorScheme.copyWith(
      surface: AppColors.blackColor,
      primary: AppColors.greyColor,
      primaryContainer: AppColors.brightGreyColor,
      onPrimary: AppColors.whiteColor),
  // tabBarTheme: const TabBarTheme(
  //   labelColor: AppColors.greyColor,
  //   unselectedLabelColor: AppColors.greyColor,
  //   indicator: BoxDecoration(
  //     color: AppColors.whiteColor,
  //     borderRadius: Circular.circular16,
  //   ),
  //
  // ),
);
