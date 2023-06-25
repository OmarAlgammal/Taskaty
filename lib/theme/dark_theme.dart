
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constance/dimens.dart';
import 'colors.dart';

ThemeData darkTheme () => ThemeData(
  primarySwatch: const MaterialColor(0xff000000, {
    50: Color.fromRGBO(0, 0, 0, .1),
    100: Color.fromRGBO(0, 0, 0, .2),
    200: Color.fromRGBO(0, 0, 0, .3),
    300: Color.fromRGBO(0, 0, 0, .4),
    400: Color.fromRGBO(0, 0, 0, .5),
    500: Color.fromRGBO(0, 0, 0, .6),
    600: Color.fromRGBO(0, 0, 0, .7),
    700: Color.fromRGBO(0, 0, 0, .8),
    800: Color.fromRGBO(0, 0, 0, .9),
    900: Color.fromRGBO(0, 0, 0, 10),
  }),
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: whiteColor,
    onPrimary: greenColor,
    secondary: greyColor,
    background: blackColor,
    error: redColor,
  ),
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: blackColor,
        systemNavigationBarColor: whiteColor,
      ),
      backgroundColor: blackColor,
      elevation: size0,
      titleTextStyle: TextStyle(
        fontSize: size24,
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: whiteColor,
      )),
  iconTheme: const IconThemeData(
    color: whiteColor,
  ),
);