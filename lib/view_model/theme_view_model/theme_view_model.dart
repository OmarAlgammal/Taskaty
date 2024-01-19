import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/repositories/local_service_repos/theme_repo.dart';

import '../../theme/dark_theme/dartk_theme.dart';
import '../../theme/light_theme/light_theme.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeData _myTheme = lightTheme;

  final BaseThemeRepo _baseThemeRepo;
  ThemeViewModel(this._baseThemeRepo);

  static ThemeViewModel instance(BuildContext context) =>
      Provider.of<ThemeViewModel>(context, listen: false);

  ThemeData getTheme() {
    bool? isLightTheme = _baseThemeRepo.getLightThemeValue();

    _myTheme = isLightTheme != null
        ? (isLightTheme ? lightTheme : darkTheme)
        : lightTheme;
    return _myTheme;
  }

  void changeTheme() {
    _myTheme = _myTheme == lightTheme ? darkTheme : lightTheme;
    _baseThemeRepo.setLightThemeValue(_myTheme == lightTheme);
    notifyListeners();
  }
}
