import 'package:either_dart/src/either.dart';
import 'package:hive/hive.dart';
import 'package:taskaty/core/errors/error.dart';

import '../../models/task_model/task_model.dart';
import '../../services/local/hive_services.dart';
import '../BaseTasksRepo.dart';

abstract class BaseLocalTasksRepo<T> implements BaseTasksRepo {
  Future<int> clearData();

  Box<TaskModel> getBox();

  Stream<TaskModel> getTasksStream({
    required String key,
  });
}

class LocalTasksRepo implements BaseLocalTasksRepo {
  final BaseHiveService<TaskModel> _baseHiveService;

  LocalTasksRepo(this._baseHiveService);

  @override
  Future<int> clearData() async {
    return await _baseHiveService.clearData();
  }

  @override
  Stream<TaskModel> getTasksStream({
    required String key,
  }) {
    return _baseHiveService.getStream(key,
        (boxEvent) => TaskModel.fromJson(boxEvent as Map<String, dynamic>));
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
    return _baseHiveService.writeData(task.id, task);
  }
}
