import '../../services/local/my_shared_preferences.dart';

abstract class BaseThemeRepo {
  bool? getLightThemeValue();

  Future<void> setLightThemeValue(bool value);
}

class ThemeRepo implements BaseThemeRepo {
  final BaseSharedPreferences _prefs;

  ThemeRepo(this._prefs);

  final lightTheme = 'light-theme';

  @override
  bool? getLightThemeValue() {
    return _prefs.getBoolValue(lightTheme);
  }

  @override
  Future<void> setLightThemeValue(bool value) async {
    await _prefs.setBoolData(lightTheme, value);
  }
}
