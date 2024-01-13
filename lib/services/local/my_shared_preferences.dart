import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseSharedPreferences {
  Future<void> init();

  Future<void> setBoolData(String key, bool data);

  bool? getBoolValue(String data);
}

class MySharedPreferences implements BaseSharedPreferences {
  late final SharedPreferences _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> setBoolData(String key, bool data) async {
    await _prefs.setBool(key, data);
  }

  @override
  bool? getBoolValue(String key) {
    return _prefs.getBool(key);
  }
}
