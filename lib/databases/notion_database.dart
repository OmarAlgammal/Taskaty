
import 'package:either_dart/either.dart';

import '../core/errors/failure.dart';
import '../core/mappers/notion_mappers.dart';
import '../core/network/constants/notion_api_constance.dart';
import '../models/task_model/task_model.dart';
import '../services/notion_services.dart';

abstract class BaseNotionDataBase {
  Future<Either<ServerFailure, List<TaskModel>>> getTasks(
      {required String databaseId, Map<String, dynamic>? query});

  Future<Either<ServerFailure, TaskModel>> createTask(
      {required TaskModel task});

  Future<Either<ServerFailure, String>> createDatabase(
      {required String userId});

  Future<Either<ServerFailure, TaskModel>> updateTask({
    required TaskModel task,
  });

  Future<Either<ServerFailure, void>> deleteTask({required String taskId});
}

class NotionDataBase implements BaseNotionDataBase {
  final BaseNotionService _baseNotionDataSource;

  NotionDataBase(this._baseNotionDataSource);

  @override
  Future<Either<ServerFailure, void>> deleteTask(
      {required String taskId}) async {
    return await _baseNotionDataSource.deleteData(taskId: taskId);
  }

  @override
  Future<Either<ServerFailure, TaskModel>> updateTask(
      {required TaskModel task}) async {
        task.completed;
    return await _baseNotionDataSource.updateData(
      map: task.toJson(),
      id: task.remoteId!,
      builder: (map) => TaskModel.fromJson(map),
    );
  }

  @override
  Future<Either<ServerFailure, List<TaskModel>>> getTasks(
      {required String databaseId, Map<String, dynamic>? query}) async {
    final results = await _baseNotionDataSource.getData<List<TaskModel>>(
        builder: (maps) {
          return maps.map((e) => TaskModel.fromJson(e)).toList();
        },
        databaseId: databaseId);
    return results;
  }

  @override
  Future<Either<ServerFailure, String>> createDatabase(
      {required String userId}) async {
    return await _baseNotionDataSource.createData<String>(
        path: NotionApiConstance.createDatabasePath,
        map: NotionMappers.mainDatabase(userId: userId),
        builder: (map) => map['id'] as String);
  }

  @override
  Future<Either<ServerFailure, TaskModel>> createTask({required TaskModel task}) async{
    final result = await _baseNotionDataSource.createData<TaskModel>(
      path: NotionApiConstance.createTaskPath,
      map: task.toJson(),
      builder: (map) => TaskModel.fromJson(map['properties']),
    );
    return result;
  }


}
