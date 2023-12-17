import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/dark_theme/dartk_theme.dart';
import '../../theme/light_theme/light_theme.dart';


class ThemeViewModel extends ChangeNotifier {

  bool _isLightTheme = true;
  ThemeData _myTheme = lightTheme;

  static ThemeViewModel instance (BuildContext context) => Provider.of<ThemeViewModel>(context, listen: false);

  ThemeData get myTheme => _myTheme;

  void changeTheme() {
    _isLightTheme = ! _isLightTheme;
    _myTheme = _isLightTheme ? lightTheme : darkTheme;
    notifyListeners();
  }
}

