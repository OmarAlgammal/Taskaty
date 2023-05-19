
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseSharedPreferences {
  Future<void> init();

  Future<void> setStringData(String key, String data);

  String? getStringData(String data);
}

class MySharedPreferences implements BaseSharedPreferences {
  late final SharedPreferences _prefs;


  @override
  String? getStringData(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> setStringData(String key, String data) async {
    await _prefs.setString(key, data);
  }
}
