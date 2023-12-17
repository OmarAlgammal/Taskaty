import '../../services/local/my_shared_preferences.dart';

abstract class BaseLocalUtilsRepo {
  bool getWelcomeScreenValue();

  Future<void> setWelcomeScreenValue();
}

class LocalUtilsRepo implements BaseLocalUtilsRepo {
  final BaseSharedPreferences _prefs;

  LocalUtilsRepo(this._prefs);

  final welcomeScreenKeyName = 'welcome-screen-key-name';

  @override
  bool getWelcomeScreenValue() {
    return _prefs.getBoolValue(welcomeScreenKeyName);
  }

  @override
  Future<void> setWelcomeScreenValue() async {
    await _prefs.setBoolData(welcomeScreenKeyName, true);
  }
}
