import 'package:flutter/material.dart';

import '../../utils/constance/border_radius.dart';
import '../colors.dart';

final darkTheme = ThemeData.dark().copyWith(
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: AppColors.greyColor),
  primaryColor: AppColors.whiteColor,
  colorScheme: ThemeData.dark().colorScheme.copyWith(
      background: AppColors.blackColor,
      primary: AppColors.greenColor,
      onPrimary: AppColors.whiteColor),
  tabBarTheme: const TabBarTheme(
    labelColor: AppColors.greenColor,
    unselectedLabelColor: AppColors.greyColor,
    indicator: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: Circular.circular16,
    ),
  ),
);
