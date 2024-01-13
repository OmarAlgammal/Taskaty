import 'package:either_dart/src/either.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/core/errors/error.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/utils/typedefs/typedef.dart';

abstract class BaseHiveService<T> {
  Future<Either<ServerError, void>> writeData(String key, T value);

  Future<Either<MyError, void>> deleteData({required String key});

  Stream<T> getStream(String key, HiveQueryBuilder<T> hiveQueryBuilder);

  Box<T> getBox();

  Future<void> closeBox();

  Future<int> clearData();
}

class HiveServices<T> implements BaseHiveService<T> {
  late Box<T> _box;
  final String _boxName;

  HiveServices(this._boxName) {
    this._boxName;
  }

  Future<void> init() async {
    await Hive.initFlutter();
    await initBox(_boxName);
  }

  Future<void> initBox(String boxName) async {
    _box = await Hive.openBox<T>(boxName);
  }

  @override
  Future<Either<ServerError, void>> writeData(String key, T value) async {
    try {
      final result = await _box.put(key, value);
      return Right(result);
    } on HiveError catch (error) {
      /// TODO: Refactor error exception
      return Left(
          ServerError(message: 'Failed to set Data to server : $error'));
    } catch (error) {
      return Left(ServerError(message: 'Failed to set Data: $error'));
    }
  }

  @override
  Future<Either<MyError, void>> deleteData({required String key}) async {
    try {
      final deleteResult = await _box.delete(key);
      return Right(deleteResult);
    } on HiveError catch (error) {
      /// TODO: Refactor error exception
      return Left(
          ServerError(message: 'Failed to set Data to server : $error'));
    } catch (error) {
      return Left(ServerError(message: 'Failed to set Data: $error'));
    }
  }

  @override
  Stream<T> getStream(String key, HiveQueryBuilder<T> hiveQueryBuilder) {
    return _box.watch(key: key).map((event) => hiveQueryBuilder(event));
  }

  @override
  Future<void> closeBox() async {
    await _box.close();
  }

  @override
  Future<int> clearData() async {
    return await _box.clear();
  }

  @override
  Box<T> getBox() {
    return _box;
  }
}
