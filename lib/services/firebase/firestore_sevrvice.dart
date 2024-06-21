import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:taskaty/core/errors/error.dart';
import 'package:taskaty/core/exceptions/dio_exceptions.dart';
import 'package:taskaty/utils/typedefs/typedef.dart';

abstract class BaseFireStoreService {
  Future<Either<MyError, void>> setData(
      {required String path, required Map<String, dynamic> map});

  Future<Either<MyError, void>> deleteData({required String path});

  Future<Either<MyError, T>> getCollection<T>(
      {required String path,
      required QuerySnapshotBuilder<T> querySnapshotBuilder,
      QueryBuilder? queryBuilder});

  Future<Either<MyError, T>> getDoc<T>({
    required String path,
    required DataBuilder<T> dataBuilder,
  });

  Stream<T> getStreamCollection<T>(
      {required String path,
      QueryBuilder? queryBuilder,
      required QuerySnapshotBuilder<T> querySnapshotBuilder});
}

/// TODO: Collect messages and paths in separate files

class FireStoreService implements BaseFireStoreService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<Either<MyError, T>> getCollection<T>({
    required String path,
    required QuerySnapshotBuilder<T> querySnapshotBuilder,
    QueryBuilder? queryBuilder,
  }) async {
    try {
      Query collection = _fireStore.collection(path);
      collection = queryBuilder != null ? queryBuilder(collection) : collection;
      final querySnapshot = await collection.get();
      return Right(querySnapshotBuilder(querySnapshot.docs));
    } on FirebaseException catch (error) {
      return Left(HandlingDioExceptions.handleFirebaseException(error));
    } catch (error) {
      return Left(ServerError(message: 'Failed to get Data : $error'));
    }
  }

  @override
  Future<Either<MyError, void>> setData(
      {required String path, required Map<String, dynamic> map}) async {
    try {
      final setDataResult = await _fireStore.doc(path).set(map);
      return Right(setDataResult);
    } on FirebaseException catch (error) {
      return Left(HandlingDioExceptions.handleFirebaseException(error));
    } catch (error) {
      return Left(ServerError(message: 'Failed to get Data : $error'));
    }
  }

  @override
  Future<Either<MyError, T>> getDoc<T>({
    required String path,
    required DataBuilder<T> dataBuilder,
  }) async {
    try {
      final snapshot = await _fireStore.doc(path).get();
      return Right(dataBuilder(snapshot.data()));
    } on FirebaseException catch (error) {
      return Left(HandlingDioExceptions.handleFirebaseException(error));
    } catch (error) {
      return Left(ServerError(message: 'Failed to get Data : $error'));
    }
  }

  @override
  Stream<T> getStreamCollection<T>(
      {required String path,
      QueryBuilder? queryBuilder,
      required QuerySnapshotBuilder<T> querySnapshotBuilder}) {
    Query collection = _fireStore.collection(path);
    collection = queryBuilder != null ? queryBuilder(collection) : collection;

    final snapshot = collection.snapshots();
    return snapshot.map((event) => querySnapshotBuilder(event.docs));
  }

  @override
  Future<Either<MyError, void>> deleteData({required String path}) async {
    try {
      final deletingResult = await _fireStore.doc(path).delete();
      return Right(deletingResult);
    } on FirebaseException catch (error) {
      return Left(HandlingDioExceptions.handleFirebaseException(error));
    } catch (error) {
      return Left(ServerError(message: 'Failed to get Data : $error'));
    }
  }
}
