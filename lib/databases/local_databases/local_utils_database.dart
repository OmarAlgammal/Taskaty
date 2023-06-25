import '../../services/local_services/my_shared_preferences.dart';

abstract class BaseLocalUtilsDatabase {
  DateTime getModificationDate({required String key});

  Future<void> setModificationDate({required String key});
}

class LocalUtilsDatabase implements BaseLocalUtilsDatabase {
  final BaseSharedPreferences _prefs;

  LocalUtilsDatabase(this._prefs);

  @override
  DateTime getModificationDate({required String key}) {
    final date = _prefs.getStringData(key);
    // Note : if date is null return old date
    return date != null ? DateTime.parse(date) : DateTime(2000);
  }

  @override
  Future<void> setModificationDate({required String key}) async {
    await _prefs.setStringData(key, DateTime.now().toString());
  }
}
