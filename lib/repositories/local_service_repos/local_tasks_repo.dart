import 'package:either_dart/src/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:taskaty/core/errors/error.dart';

import '../../models/task_model/task_model.dart';
import '../../services/local/hive_services.dart';
import '../BaseTasksRepo.dart';

abstract class BaseLocalTasksRepo<T> implements BaseTasksRepo {
  Future<int> clearData();

  Box<TaskModel> getBox();

  Stream<List<TaskModel>> getTasksStream();
}

class LocalTasksRepo implements BaseLocalTasksRepo {
  final BaseHiveService<TaskModel> _baseHiveService;

  LocalTasksRepo(this._baseHiveService);

  @override
  Future<int> clearData() async {
    return await _baseHiveService.clearData();
  }

  @override
  Stream<List<TaskModel>> getTasksStream() async*{
    /// Because hive doesn't provide a direct Stream
    /// so this line to get list of data then yield any changing in box using second line
    yield _baseHiveService.getBox().values.toList();
    await for (var event in _baseHiveService.getBox().watch()) {
      yield _baseHiveService.getBox().values.toList();
    }
  }

  @override
  Box<TaskModel> getBox() {
    return _baseHiveService.getBox();
  }

  @override
  Future<Either<MyError, void>> deleteTask({required String id}) {
    return _baseHiveService.deleteData(key: id);
  }

  @override
  Future<Either<MyError, void>> setTask({required TaskModel task}) {
    return _baseHiveService.writeData(task.localId, task);
  }
}
