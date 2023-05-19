import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../core/errors/exceptions.dart';
import '../core/errors/server_failure.dart';
import 'package:taskaty/models/task_model/task_model.dart';

import '../core/network/api_constance.dart';
import '../core/network/server_message_model.dart';

typedef DataBuilder<T> = T Function(List<Map<String, dynamic>> maps);

abstract class BaseNotionService {
  Future<Either<ServerFailure, TaskModel>> createData(
      {required Map<String, dynamic> map});

  Future<Either<ServerFailure, T>> getData<T>(
      {required DataBuilder builder,
      Map<String, dynamic>? query,
      required String databaseId});

  Future<Either<ServerFailure, TaskModel>> updateData(
      {required Map<String, dynamic> map, required String taskId});

  Future<Either<ServerFailure, void>> deleteData({required String taskId});
}

class NotionService implements BaseNotionService {
  late Dio _dio;

  NotionService() {
    /// TODO: Refactor this code
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstance.baseurl,
        headers: {
          'Notion-Version': '2022-06-28',
          'Content-Type': 'application/json',
          'authorization':
              'Bearer secret_JM7Wrj7qcdflIbjWxZJPUzqygCZdd7lh30pLkKii9j6',
        },
      ),
    );
  }

  @override
  Future<Either<ServerFailure, void>> deleteData(
      {required String taskId}) async {
    try {
      final response = await _dio.delete(ApiConstance.deleteTaskPath(taskId));
      if (response.statusCode != 200) {
        throw ServerException(ServerMessageModel.fromJson(response.data));
      }
      return const Right(null);
    } on ServerException catch (error) {
      return Left(ServerFailure('Failed to delete data from server : $error'));
    } catch (error) {
      // handel generals errors like network issue, server issues
      throw Left(ServerFailure('Failed to delete data : $error'));
    }
  }

  @override
  Future<Either<ServerFailure, TaskModel>> createData(
      {required Map<String, dynamic> map}) async {
    try {
      final response = await _dio.post(ApiConstance.createTaskPath, data: map);
      if (response.statusCode != 200) {
        return Left(
            ServerFailure('Error status message ${response.statusMessage}'));
      }
      return Right(TaskModel.fromJson(response.data['properties']));
    } on ServerException catch (error) {
      return Left(ServerFailure('Field to create data to server: $error'));
    } catch (error) {
      return Left(ServerFailure('Failed To create data : $error'));
    }
  }

  @override
  Future<Either<ServerFailure, TaskModel>> updateData(
      {required Map<String, dynamic> map, required String taskId}) async {
    try {
      final response =
          await _dio.patch(ApiConstance.updateTaskPath(taskId), data: map);
      if (response.statusCode != 200) {
        return Left(
            ServerFailure('Error status message ${response.statusMessage}'));
      } else {
        return Right(TaskModel.fromJson(response.data));
      }
    } on ServerException catch (error) {
      return Left(ServerFailure('Failed to update data to server : $error'));
    } catch (error) {
      return Left(ServerFailure('Failed to update data : $error'));
    }
  }

  @override
  Future<Either<ServerFailure, T>> getData<T>(
      {required DataBuilder builder,
      Map<String, dynamic>? query,
      required String databaseId}) async {
    try {
      final response =
          await _dio.post(ApiConstance.databasePath(databaseId), data: query);
      if (response.statusCode != 200) {
        return Left(ServerFailure(
            'Error status code message ${response.statusMessage}'));
      } else {
        final results = response.data['results'] as List;
        return Right(builder(results
            .map((e) => e['properties'] as Map<String, dynamic>)
            .toList()));
      }
    } on ServerException catch (error) {
      return Left(ServerFailure('Failed to update data to server : $error'));
    } catch (error) {
      return Left(ServerFailure('Failed to update data : $error'));
    }
  }
}
