import '../../services/local/my_shared_preferences.dart';

abstract class BaseSettingsRepo {
  bool gerSettingValue();

  Future<void> setSettingValue(bool value);
}

class ThemeSettingRepo implements BaseSettingsRepo {
  final BaseSharedPreferences _prefs;

  ThemeSettingRepo(this._prefs);

  final themeKey = 'light-theme';

  @override
  bool gerSettingValue() {
    return _prefs.getBoolValue(themeKey) ?? true;
  }

  @override
  Future<void> setSettingValue(bool value) async {
    await _prefs.setBoolData(themeKey, value);
  }

}

class LanguageSettingRepo implements BaseSettingsRepo{

  final BaseSharedPreferences _prefs;
  LanguageSettingRepo(this._prefs);

  final languageKey = 'english';


  @override
  bool gerSettingValue() {
    return _prefs.getBoolValue(languageKey) ?? true;
  }

  @override
  Future<void> setSettingValue(bool value) {
    return _prefs.setBoolData(languageKey, value);
  }

}
