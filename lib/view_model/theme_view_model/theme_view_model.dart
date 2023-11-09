import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/theme/dark_theme.dart';
import 'package:taskaty/theme/light_theme.dart';

class ThemeViewModel extends ChangeNotifier {

  bool _lightTheme = true;
  ThemeData _myTheme = lightTheme;

  static ThemeViewModel instance (BuildContext context) => Provider.of<ThemeViewModel>(context);

  ThemeData get myTheme => _myTheme;

  void changeTheme() {
    _lightTheme = ! _lightTheme;
    _myTheme = _lightTheme ? lightTheme : darkTheme;
    notifyListeners();
  }
}
