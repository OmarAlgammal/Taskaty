import 'package:either_dart/either.dart';
import 'package:taskaty/core/database/constance/local_utils_database_keys.dart';
import 'package:taskaty/databases/auth_database.dart';
import 'package:taskaty/databases/firestore_database.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/databases/local_databases/local_utils_database.dart';
import 'package:taskaty/databases/notion_database.dart';
import 'package:taskaty/models/task_model/task_model.dart';

import '../../../core/errors/failure.dart';

class SyncTaskUseCase {
  final BaseLocalUtilsDatabase _baseLocalUtilsDatabase;
  final BaseLocalTasksDatabase _baseLocalTasksDatabase;
  final BaseNotionDataBase _baseNotionDataBase;
  final BaseFireStoreDatabase _baseFireStoreDatabase;
  final BaseAuthDatabase _baseAuthDatabase;

  late DateTime _lastRemoteModificationDate;

  SyncTaskUseCase(
      this._baseLocalUtilsDatabase,
      this._baseLocalTasksDatabase,
      this._baseNotionDataBase,
      this._baseFireStoreDatabase,
      this._baseAuthDatabase);

  /// TODO: Refactor this function
  Future syncTasks() async {
    _lastRemoteModificationDate = _baseLocalUtilsDatabase.getModificationDate(
        key: LocalUtilsDatabaseKeys.lastRemoteModificationDate);
    final lastLocalModificationDate =
        _baseLocalUtilsDatabase.getModificationDate(
            key: LocalUtilsDatabaseKeys.lastLocalModificationDate);

    // if there is no tasks to upload
    if (!lastLocalModificationDate.isAfter(_lastRemoteModificationDate)) return;

    // if notion database id for this user is null, make sure from remote datasource first then create one
    if (_baseFireStoreDatabase.notionDatabaseId == null) {
      final getNotionDatabaseIdResult = await _baseFireStoreDatabase
          .getNotionDatabaseId(userId: _baseAuthDatabase.currentUser.uid);
      if (getNotionDatabaseIdResult.isLeft) return;
      if (getNotionDatabaseIdResult.isRight) {
        if (getNotionDatabaseIdResult.right == null) {
          final result = await _createNotionDatabase();
          if (result.isLeft) return;
        }
      }
    }

    if (lastLocalModificationDate.isAfter(_lastRemoteModificationDate)) {
      await Future.wait([
        _uploadTasks(),
        _updateTasks(),
      ]);
    }
  }

  Future<Either<ServerFailure, String>> _createNotionDatabase() async {
    final userId = _baseAuthDatabase.currentUser.uid;
    final createNotionDatabaseResult =
        await _baseNotionDataBase.createDatabase(userId: userId);
    if (createNotionDatabaseResult.isRight) {
      await _baseFireStoreDatabase.setNotionDatabaseId(
          userId: userId, notionDatabaseId: createNotionDatabaseResult.right);
    }
    return createNotionDatabaseResult;
  }

  Future<void> _updateTasks() async {
    final tasksToUpdate = _getTasksToUpdateInNotion();
    for (final task in tasksToUpdate) {
      await _baseNotionDataBase.updateTask(task: task).then((value) {
        if (value.isRight) {
          _writeInLocalAfterSyncing(value.right);
        }
      });
    }
  }

  Future<void> _uploadTasks() async {
    final tasksToUpload = _getTasksDidNotUploadedToNotion();
    for (final task in tasksToUpload) {
      await _baseNotionDataBase.createTask(task: task).then((value) {
        if (value.isRight) {
          _writeInLocalAfterSyncing(value.right);
        }
      });
    }
  }

  List<TaskModel> _getTasksDidNotUploadedToNotion() {
    return _baseLocalTasksDatabase.getList(
        query: (task) => task.remoteId == null);
  }

  List<TaskModel> _getTasksToUpdateInNotion() {
    return _baseLocalTasksDatabase.getList(
      query: (task) =>
          task.remoteId != null &&
          task.isModificationDateAfterDate(date: _lastRemoteModificationDate),
    );
  }

  void _writeInLocalAfterSyncing(TaskModel task) {
    _baseLocalTasksDatabase.writeData(task.localId, task);
    _baseLocalUtilsDatabase.setModificationDate(
        key: LocalUtilsDatabaseKeys.lastLocalModificationDate);
    _baseLocalUtilsDatabase.setModificationDate(
        key: LocalUtilsDatabaseKeys.lastRemoteModificationDate);
  }
}
