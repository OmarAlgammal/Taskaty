import 'package:either_dart/either.dart';

import '../core/errors/server_failure.dart';
import '../core/network/api_constance.dart';
import '../models/task_model/task_model.dart';
import '../services/notion_services.dart';

abstract class BaseNotionDataBase {
  Future<Either<ServerFailure, List<TaskModel>>> getTasks(
      {Map<String, dynamic>? query});

  Future<Either<ServerFailure, TaskModel>> createTask(
      {required Map<String, dynamic> map});

  Future<Either<ServerFailure, TaskModel>> updateTask({
    required String taskId,
    required Map<String, dynamic> map,
  });

  Future<Either<ServerFailure, void>> deleteTask({required String taskId});
}

class NotionDataBase implements BaseNotionDataBase {
  final BaseNotionService _baseNotionDataSource;

  NotionDataBase(this._baseNotionDataSource);

  @override
  Future<Either<ServerFailure, TaskModel>> createTask(
      {required Map<String, dynamic> map}) async {
    return await _baseNotionDataSource.createData(map: map);
  }

  @override
  Future<Either<ServerFailure, void>> deleteTask(
      {required String taskId}) async {
    return await _baseNotionDataSource.deleteData(taskId: taskId);
  }

  @override
  Future<Either<ServerFailure, TaskModel>> updateTask(
      {required String taskId, required Map<String, dynamic> map}) async {
    return await _baseNotionDataSource.updateData(map: map, taskId: taskId);
  }

  @override
  Future<Either<ServerFailure, List<TaskModel>>> getTasks(
      {Map<String, dynamic>? query}) async {
    final results = await _baseNotionDataSource.getData<List<TaskModel>>(
        builder: (maps) {
          return maps.map((e) => TaskModel.fromJson(e)).toList();
        },
        databaseId: ApiConstance.tasksDatabaseId);
    return results;
  }
}
