import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';

import '../core/errors/failure.dart';
import '../core/errors/server_exceptions.dart';
import '../core/network/constants/notion_api_constance.dart';
import '../core/network/server_message_model.dart';

typedef DataBuilder<T> = T Function(List<Map<String, dynamic>> maps);

abstract class BaseNotionService {
  Future<Either<ServerFailure, T>> createData<T>(
      {required String path,
      required Map<String, dynamic> map,
      required Function(Map<String, dynamic> map) builder});

  Future<Either<ServerFailure, T>> getData<T>(
      {required DataBuilder builder,
      Map<String, dynamic>? query,
      required String databaseId});

  Future<Either<ServerFailure, T>> updateData<T>({
    required Map<String, dynamic> map,
    required String id,
    required T Function(Map<String, dynamic> map) builder,
  });

  Future<Either<ServerFailure, void>> deleteData({required String taskId});
}

class NotionService implements BaseNotionService {
  late Dio _dio;

  NotionService() {
    /// TODO: Refactor this code
    _dio = Dio(
      BaseOptions(
        baseUrl: NotionApiConstance.baseurl,
        headers: {
          'Notion-Version': '2022-06-28',
          'Content-Type': 'application/json',
          'authorization':
              'Bearer secret_O76bCHbib2zHUHi23MbRenhai7DLgjchZ8Zq1pMvoHp',
        },
      ),
    );
  }

  @override
  Future<Either<ServerFailure, void>> deleteData(
      {required String taskId}) async {
    try {
      final response =
          await _dio.delete(NotionApiConstance.deleteTaskPath(taskId));
      if (response.statusCode != 200) {
        throw ServerException(ServerMessageModel.fromJson(response.data));
      }
      return const Right(null);
    } on ServerException catch (error) {
      return Left(
          ServerFailure(message: 'Failed to delete data from server : $error'));
    } catch (error) {
      // handel generals errors like network issue, server issues
      throw Left(ServerFailure(message: 'Failed to delete data : $error'));
    }
  }

  @override
  Future<Either<ServerFailure, T>> createData<T>(
      {required String path,
      required Map<String, dynamic> map,
      required Function(Map<String, dynamic> map) builder}) async {
    try {
      final response = await _dio.post(path, data: map);
      debugPrint('here ata create data : response is ${response.statusCode}');
      if (response.statusCode != 200) {
        return Left(ServerFailure(
            message: 'Error status message ${response.statusMessage}'));
      }
      return Right(builder(response.data));
    } on ServerException catch (error) {
      return Left(
          ServerFailure(message: 'Field to create data to server: $error'));
    } catch (error) {
      return Left(ServerFailure(message: 'Failed To create data : $error'));
    }
  }

  @override
  Future<Either<ServerFailure, T>> getData<T>(
      {required DataBuilder builder,
      Map<String, dynamic>? query,
      required String databaseId}) async {
    try {
      final response = await _dio
          .post(NotionApiConstance.databasePath(databaseId), data: query);
      if (response.statusCode != 200) {
        return Left(ServerFailure(
            message: 'Error status code message ${response.statusMessage}'));
      } else {
        final results = response.data['results'] as List;
        return Right(builder(results
            .map((e) => e['properties'] as Map<String, dynamic>)
            .toList()));
      }
    } on ServerException catch (error) {
      return Left(
          ServerFailure(message: 'Failed to update data to server : $error'));
    } catch (error) {
      return Left(ServerFailure(message: 'Failed to update data : $error'));
    }
  }

  @override
  Future<Either<ServerFailure, T>> updateData<T>({
    required Map<String, dynamic> map,
    required String id,
    required T Function(Map<String, dynamic> map) builder,
  }) async {
    try {
      final response =
          await _dio.patch(NotionApiConstance.updateTaskPath(id), data: map);
      if (response.statusCode != 200) {
        return Left(ServerFailure(
            message: 'Error status message ${response.statusMessage}'));
      } else {
        return Right(builder(response.data));
      }
    } on ServerException catch (error) {
      return Left(
          ServerFailure(message: 'Failed to update data to server : $error'));
    } catch (error) {
      return Left(ServerFailure(message: 'Failed to update data : $error'));
    }
  }
}
