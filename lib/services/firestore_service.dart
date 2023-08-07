import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskaty/core/errors/server_exceptions.dart';
import 'package:taskaty/core/errors/failure.dart';

abstract class BaseFireStoreService {
  Future<Either<ServerFailure, void>> setData({required String docId, required String docValue});

  Future<Either<ServerFailure, String?>> getData({required String data});
}


/// TODO: Collect messages and paths in separate files

class FireStoreService implements BaseFireStoreService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<Either<ServerFailure, String?>> getData({required String data}) async {
    try {
      final snapshot = await _fireStore
          .collection('Users').doc(data)
          .get(const GetOptions(source: Source.cache));
      if (! snapshot.exists) return const Right(null);
      final result = snapshot.data()!['databaseId'];
      return Right(result);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(message: 'Failed to get data from server : $error'));
    } catch (error) {
      return Left(ServerFailure(message: 'Failed to get Data : $error'));
    }
  }

  @override
  Future<Either<ServerFailure, void>> setData(
      {required String docId, required String docValue}) async {
    try {
      final setDataResult =
          await _fireStore.doc('Users/$docId').set({'databaseId': docValue});
      return Right(setDataResult);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(message: 'Failed to set Data to server : $error'));
    } catch (error) {
      return Left(ServerFailure(message: 'Failed to set Data: $error'));
    }
  }
}
