import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constance/border_radius.dart';
import '../../../utils/constance/my_padding.dart';
import '../colors.dart';
import '../colors.dart';

final lightTheme = ThemeData.light().copyWith(
  primaryColor: AppColors.greenColor,
  tabBarTheme: const TabBarTheme(
    labelColor: AppColors.whiteColor,
    unselectedLabelColor: AppColors.greyColor,
    indicator: BoxDecoration(
      color: AppColors.greenColor,
      borderRadius: Circular.circular16,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.greenColor,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(color: AppColors.greenColor),
    iconTheme: IconThemeData(color: AppColors.blackColor),
    actionsIconTheme: IconThemeData(
      color: AppColors.greenColor
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
    primary: AppColors.greenColor,
    onPrimary: AppColors.whiteColor,
  ),

);
