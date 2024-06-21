import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/repositories/local_service_repos/settings_repo.dart';

import '../../theme/dark_theme/dartk_theme.dart';
import '../../theme/light_theme/light_theme.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeData _myTheme = lightTheme;

  final BaseSettingsRepo _baseSettingsRepo;
  ThemeViewModel(this._baseSettingsRepo);

  static ThemeViewModel instance(BuildContext context) =>
      Provider.of<ThemeViewModel>(context, listen: false);

  ThemeData getTheme() {
    return  _baseSettingsRepo.gerSettingValue() ? lightTheme : darkTheme;
  }

  bool isLightTheme() => _baseSettingsRepo.gerSettingValue();

  void changeTheme() {
    _myTheme = _myTheme == lightTheme ? darkTheme : lightTheme;
    _baseSettingsRepo.setSettingValue(_myTheme == lightTheme);
    notifyListeners();
  }

}
