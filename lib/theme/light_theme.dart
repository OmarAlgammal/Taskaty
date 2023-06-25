import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constance/dimens.dart';
import 'colors.dart';

ThemeData lightTheme() => ThemeData(
      primarySwatch: const MaterialColor(0xffffffff, {
        50: Color.fromRGBO(36, 44, 82, .1),
        100: Color.fromRGBO(255, 255, 255, .2),
        200: Color.fromRGBO(255, 255, 255, .3),
        300: Color.fromRGBO(255, 255, 255, .4),
        400: Color.fromRGBO(255, 255, 255, .5),
        500: Color.fromRGBO(255, 255, 255, .6),
        600: Color.fromRGBO(255, 255, 255, .7),
        700: Color.fromRGBO(255, 255, 255, .8),
        800: Color.fromRGBO(255, 255, 255, .9),
        900: Color.fromRGBO(255, 255, 255, 1),
      }),
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: blackColor,
        onPrimary: greenColor,
        secondary: brightGreyColor,
        background: whiteColor,
        error: redColor,
      ),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: whiteColor,
            systemNavigationBarColor: blackColor,
          ),
          backgroundColor: whiteColor,
          elevation: size0,
          titleTextStyle: TextStyle(
            fontSize: size24,
            color: blackColor,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: blackColor,
          )),
      iconTheme: const IconThemeData(
        color: blackColor,
      ),
    );
