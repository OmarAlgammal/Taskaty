import '../../services/local_services/my_shared_preferences.dart';

abstract class BaseLocalUtilsDatabase {
  DateTime? getLastDateModification();

  Future<void> setLastModificationDate();
}

class LocalUtilsDatabase implements BaseLocalUtilsDatabase {
  final BaseSharedPreferences _prefs;

  final String _modificationDateKey = 'last-modification-date';

  LocalUtilsDatabase(this._prefs);

  @override
  DateTime? getLastDateModification() {
    final date = _prefs.getStringData(_modificationDateKey);
    return date != null ? DateTime.parse(date) : null;
  }

  @override
  Future<void> setLastModificationDate() async {
    await _prefs.setStringData(_modificationDateKey, DateTime.now().toString());
  }
}
