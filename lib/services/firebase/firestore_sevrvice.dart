import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:taskaty/core/errors/error.dart';
import 'package:taskaty/utils/typedefs/typedef.dart';

abstract class BaseFireStoreService {
  Future<Either<ServerError, void>> setData(
      {required String path, required Map<String, dynamic> map});

  Future<Either<ServerError, List<T>>> getCollection<T>({required String path, required DataBuilder<T> dataBuilder});

  Future<Either<ServerError, T>> getDoc<T>({required String path, required DataBuilder<T> dataBuilder, GetOptions? getOptions});

  Stream<List<T>> getStreamCollection<T>(
      {required String path,
      QueryBuilder? queryBuilder,
      required DataBuilder<T> dataBuilder});
}

/// TODO: Collect messages and paths in separate files

class FireStoreService implements BaseFireStoreService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<Either<ServerError, List<T>>> getCollection<T>({required String path, required DataBuilder<T> dataBuilder}) async {
    try {
      final snapshot = await _fireStore.collection(path).get();
      return Right(snapshot.docs.map((e) => dataBuilder(e.data())).toList());
    } on FirebaseException catch (error) {
      /// TODO: Refactor error exception
      return Left(
          ServerError(message: 'Failed to get data from server : $error'));
    } catch (error) {
      return Left(ServerError(message: 'Failed to get Data : $error'));
    }
  }

  @override
  Future<Either<ServerError, void>> setData(
      {required String path, required Map<String, dynamic> map}) async {
    try {
      final setDataResult = await _fireStore.doc(path).set(map);
      return Right(setDataResult);
    } on FirebaseException catch (error) {
      /// TODO: Refactor error exception
      return Left(
          ServerError(message: 'Failed to set Data to server : $error'));
    } catch (error) {
      return Left(ServerError(message: 'Failed to set Data: $error'));
    }
  }

  @override
  Stream<List<T>> getStreamCollection<T>(
      {required String path,
      QueryBuilder? queryBuilder,
      required DataBuilder<T> dataBuilder}) {
    Query collection = _fireStore.collection(path);
    collection = queryBuilder != null ? queryBuilder(collection) : collection;

    final snapshot = collection.snapshots();
    return snapshot.map((event) => event.docs
        .map((e) => dataBuilder(e as Map<String, dynamic>))
        .where((element) => element != null)
        .toList());
  }

  @override
  Future<Either<ServerError, T>> getDoc<T>({required String path, required DataBuilder<T> dataBuilder, GetOptions? getOptions}) async{
    try {
      final snapshot = await _fireStore.doc(path).get(getOptions);
      return Right(dataBuilder(snapshot.data()));
    } on FirebaseException catch (error) {
      /// TODO: Refactor error exception
      return Left(
          ServerError(message: 'Failed to set Data to server : $error'));
    } catch (error) {
      return Left(ServerError(message: 'Failed to set Data: $error'));
    }

  }
}
