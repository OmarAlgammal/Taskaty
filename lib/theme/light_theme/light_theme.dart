import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constance/border_radius.dart';
import '../../../utils/constance/my_padding.dart';
import '../colors.dart';
import '../colors.dart';

final lightTheme = ThemeData.light().copyWith(
  primaryColor: AppColors.greyColor,
  tabBarTheme: const TabBarTheme(
    labelColor: AppColors.whiteColor,
    unselectedLabelColor: AppColors.greyColor,
    indicator: BoxDecoration(
      color: AppColors.greyColor,
      borderRadius: Circular.circular16,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.greyColor,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(color: AppColors.greyColor),
    iconTheme: IconThemeData(color: AppColors.blackColor),
    actionsIconTheme: IconThemeData(
      color: AppColors.greyColor
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    color: AppColors.transparentColor,
    elevation: 0.0,
  ),
  colorScheme: ThemeData.light().colorScheme.copyWith(
    background: AppColors.whiteColor,
    primary: AppColors.greyColor,
    onPrimary: AppColors.whiteColor,
  ),

);
