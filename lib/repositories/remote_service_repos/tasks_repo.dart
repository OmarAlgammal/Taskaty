import 'package:either_dart/either.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/services/firebase/firebase_auth.dart';
import 'package:taskaty/services/firebase/firestore_sevrvice.dart';

import '../../core/errors/error.dart';
import '../../utils/typedefs/typedef.dart';

abstract class BaseTasksRepo {
  Future<Either<ServerError, void>> setTask(
      {required String path, required Map<String, dynamic> map});

  Stream<List<TaskModel>> getTasksStream({QueryBuilder? queryBuilder});
}

class TasksRepo implements BaseTasksRepo {
  final BaseFireStoreService _baseFireStoreService;
  final BaseAuthServices _baseAuthService;

  TasksRepo(this._baseFireStoreService, this._baseAuthService);

  @override
  Future<Either<ServerError, void>> setTask(
      {required String path, required Map<String, dynamic> map}) {
    return _baseFireStoreService.setData(path: path, map: map);
  }

  @override
  Stream<List<TaskModel>> getTasksStream({QueryBuilder? queryBuilder}) {
    final tasksCollectionName = '${_baseAuthService.currentUser!.uid}/tasks';
    return _baseFireStoreService.getStreamCollection<TaskModel>(path: tasksCollectionName, queryBuilder: queryBuilder, dataBuilder: (map) => TaskModel.fromJson(map));
  }



}
