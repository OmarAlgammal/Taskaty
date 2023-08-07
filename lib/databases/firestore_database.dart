import 'package:easy_localization/easy_localization.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskaty/core/errors/failure.dart';
import 'package:taskaty/services/firestore_service.dart';

abstract class BaseFireStoreDatabase {
  Future<Either<ServerFailure, void>> setNotionDatabaseId(
      {required String userId, required String notionDatabaseId});

  Future<Either<ServerFailure, String?>>
  getNotionDatabaseId({required String userId});

  String? get notionDatabaseId;
}

class FireStoreDatabase implements BaseFireStoreDatabase {
  final BaseFireStoreService _baseFireStoreService;

  String? _notionDatabaseId;

  @override
  String? get notionDatabaseId => _notionDatabaseId;


  FireStoreDatabase(this._baseFireStoreService);

  @override
  Future<Either<ServerFailure, String?>>
      getNotionDatabaseId({required String userId}) async {
    final result = await _baseFireStoreService.getData(data: userId);
    if (result.isRight) {
      _notionDatabaseId = result.right;
      return Right(_notionDatabaseId);
    }
    return Left(result.left);
  }

  @override
  Future<Either<ServerFailure, void>> setNotionDatabaseId(
      {required String userId, required String notionDatabaseId}) async {
    _notionDatabaseId = notionDatabaseId;
    return await _baseFireStoreService.setData(
        docId: userId, docValue: notionDatabaseId);
  }

}
