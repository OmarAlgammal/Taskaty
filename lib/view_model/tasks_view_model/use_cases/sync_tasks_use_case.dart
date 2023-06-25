import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskaty/core/database/constance/local_utils_database_keys.dart';
import 'package:taskaty/databases/auth_database.dart';
import 'package:taskaty/databases/firestore_database.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/databases/local_databases/local_utils_database.dart';
import 'package:taskaty/databases/notion_database.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/service_locator/locator.dart';

import '../../../core/errors/failure.dart';

class SyncTaskUseCase {
  final BaseLocalUtilsDatabase _baseLocalUtilsDatabase;
  final BaseLocalTasksDatabase _baseLocalTasksDatabase;
  final BaseNotionDataBase _baseNotionDataBase;
  final BaseFireStoreDatabase _baseFireStoreDatabase;
  final BaseAuthDatabase _baseAuthDatabase;

  late DateTime _lastRemoteModificationDate;

  SyncTaskUseCase(this._baseLocalUtilsDatabase,
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
    if (_baseFireStoreDatabase.notionDatabaseId == null) {
      debugPrint('here at first');
      final getNotionDatabaseIdResult = await _baseFireStoreDatabase
          .getNotionDatabaseId(userId: _baseAuthDatabase.currentUser.uid);
      if (getNotionDatabaseIdResult.isRight &&
          getNotionDatabaseIdResult.right == null) {
        debugPrint('here at first then first');
        final result = await _createNotionDatabase();
        if (result.isRight) {
          if (lastLocalModificationDate.isAfter(_lastRemoteModificationDate)) {
            await Future.wait([
              _uploadTasks(),
              _updateTasks(),
            ]);
          }
        }
      } else {
        debugPrint('here at first then second');
        if (lastLocalModificationDate.isAfter(_lastRemoteModificationDate)) {
          await Future.wait([
            _uploadTasks(),
            _updateTasks(),
          ]);
        }
      }
    } else {
      debugPrint('here at second');
      if (lastLocalModificationDate.isAfter(_lastRemoteModificationDate)) {
        await Future.wait([
          _uploadTasks(),
          _updateTasks(),
        ]);
      }
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
    debugPrint('here in update tasks');
    final tasksToUpdate = _getTasksToUpdateInNotion();
    for (final task in tasksToUpdate) {
      debugPrint('here in update tasks >> one');
      await _baseNotionDataBase.updateTask(task: task).then((value) {
        debugPrint('here in update tasks >> two and value is ${value.isRight}');
        if (value.isRight) {
          _writeInLocalAfterSyncing(value.right);
        }
      });
    }
  }

  Future<void> _uploadTasks() async {
    debugPrint('here in upload tasks');
    final tasksToUpload = _getTasksDidNotUploadedToNotion();
    for (final task in tasksToUpload) {
      debugPrint('here in upload tasks >> one');
      await _baseNotionDataBase.createTask(task: task).then((value) {
        debugPrint('here in upload tasks >> two and value is ${value.isRight}');
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
            task.modificationDate.isAfter(_lastRemoteModificationDate));
  }

  void _writeInLocalAfterSyncing(TaskModel task) {
    debugPrint('here in write in local method');
    _baseLocalTasksDatabase.writeData(task.localId, task);
    _baseLocalUtilsDatabase.setModificationDate(
        key: LocalUtilsDatabaseKeys.lastLocalModificationDate);
    _baseLocalUtilsDatabase.setModificationDate(
        key: LocalUtilsDatabaseKeys.lastRemoteModificationDate);
  }
}
