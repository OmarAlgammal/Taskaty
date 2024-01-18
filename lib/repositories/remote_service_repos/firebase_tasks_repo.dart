import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:taskaty/core/network/constants/firestore_paths_constants.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/services/firebase/firebase_auth.dart';
import 'package:taskaty/services/firebase/firestore_sevrvice.dart';

import '../../core/errors/error.dart';
import '../../utils/typedefs/typedef.dart';
import '../BaseTasksRepo.dart';


abstract class BaseFirestoreTasksRepo implements BaseTasksRepo{
  Stream<List<TaskModel>> getTasksStream({QueryBuilder? queryBuilder});

  Future<Either<MyError, List<TaskModel>>> getTasksList({QueryBuilder? queryBuilder});
}

class FirestoreTasksRepo implements BaseFirestoreTasksRepo {
  final BaseFireStoreService _baseFireStoreService;
  final BaseAuthServices _baseAuthService;

  FirestoreTasksRepo(this._baseFireStoreService, this._baseAuthService);

  @override
  Future<Either<MyError, void>> setTask(
      {required TaskModel task, SetOptions? setOptions}) async {
    return _baseFireStoreService.setData(
      path: FirestorePathsConstants.singleTaskPath(
          _baseAuthService.currentUser!.uid, task.localId),
      map: task.toJson(),
    );
  }

  @override
  Stream<List<TaskModel>> getTasksStream({QueryBuilder? queryBuilder}) {
    return _baseFireStoreService.getStreamCollection<List<TaskModel>>(
        path: FirestorePathsConstants.allTasksPath(
            _baseAuthService.currentUser!.uid),
        querySnapshotBuilder: (event) => event
            .map((e) => TaskModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  @override
  Future<Either<MyError, void>> deleteTask({required String id}) async {
    return await _baseFireStoreService.deleteData(
        path: FirestorePathsConstants.singleTaskPath(
            _baseAuthService.currentUser!.uid, id));
  }

  @override
  Future<Either<MyError, List<TaskModel>>> getTasksList({QueryBuilder? queryBuilder}) async{
    return await _baseFireStoreService.getCollection<List<TaskModel>>(path: FirestorePathsConstants.allTasksPath(
        _baseAuthService.currentUser!.uid), querySnapshotBuilder: (List<QueryDocumentSnapshot<Object?>> docs){
      return docs.map((e) => TaskModel.fromJson(e.data() as Map<String, dynamic>)).toList();
    });
  }
}
