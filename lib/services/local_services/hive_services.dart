import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BaseHiveService<T> {
  Future<void> init();

  Future<void> initBox(String boxName);

  Future<void> writeData(String key, T value);

  Box<T> getBox();

  List<T> getList({required bool Function (T element) query});

  Future<void> deleteData(String key);

  bool contains(String key);

  Future<void> closeBox();
}

class HiveServices<T> implements BaseHiveService<T> {
  late Box<T> _box;
  final String _boxName;

  HiveServices(this._boxName) {
    this._boxName;
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    await initBox(_boxName);
  }

  @override
  Future<void> initBox(String boxName) async {
    _box = await Hive.openBox<T>(boxName);
  }

  @override
  bool contains(String key) {
    return _box.get(key) != null;
  }

  @override
  Future<void> deleteData(String key) async {
    await _box.delete(key);
  }

  @override
  Box<T> getBox() {
    return _box;
  }

  @override
  List<T> getList({required bool Function (T element) query}){
    return _box.values.where(query).toList();
  }

  @override
  Future<void> writeData(String key, T value) async {
    await _box.put(key, value);
  }

  @override
  Future<void> closeBox() async {
    await _box.close();
  }
}
