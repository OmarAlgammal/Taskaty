import 'package:taskaty/databases/local_databases/local_utils_database.dart';

import '../databases/storage_database.dart';
import '../databases/local_databases/local_tasks_database.dart';
import '../databases/notion_database.dart';
import '../models/task_model/task_model.dart';

class ViewModel {
  final BaseNotionDataBase _notionDataBase;

  /// TODO: Use hive data base instead of this services
  final BaseLocalTasksDatabase _localTasksDatabase;
  final BaseLocalUtilsDatabase _localUtilDatabase;

  /// TODO: use this to upload files to firebase storage then get it's link to upload to notion
  final BaseStorageDatabase _firebaseStorage;

  ViewModel(
      this._notionDataBase,
      this._localTasksDatabase,
      this._firebaseStorage,
      this._localUtilDatabase,
      );

  Future<void> syncTasks() async {
    final lastModificationDate = _localUtilDatabase.getLastDateModification() ??
        DateTime.parse('2000-01-01');
    final tasksToUpload =
    _localTasksDatabase.getList(query: (task) => task.remoteId == null);
    final tasksToUpdate = _localTasksDatabase.getList(
        query: (task) => task.remoteId != null && task.modificationDate!.isAfter(lastModificationDate));
    for (final task in tasksToUpload) {
      await _notionDataBase.createTask(map: task.toJson()).then((result) {
        if (result.isRight) {
          _writeInLocalAfterSyncing(result.right);
        }
      });
    }

    for (final task in tasksToUpdate) {
      await _notionDataBase
          .updateTask(taskId: task.remoteId!, map: task.toJson())
          .then((result) {
        if (result.isRight) {
          _writeInLocalAfterSyncing(result.right);
        }
      });
    }
  }

  Future<void> deleteTask(TaskModel task) async {
    /// TODO: Delete files from firebase storage
    try {
      if (task.remoteId != null) _notionDataBase.deleteTask(taskId: task.remoteId!);
      await _localTasksDatabase.deleteData(task.localId);
    } catch (e) {
      ///TODO: Complete this catch
    }
  }

  Future<void> updateTask(TaskModel task) async {
    task = task.copyWith(modificationDate: DateTime.now());
    /// TODO: Refactor this try
    try {
      /// Upload files to firebase and get link to add to notion
      task = await _uploadFilesNoFirebase(task: task);
      await _localTasksDatabase.writeData(task.localId, task);
      _notionDataBase
          .updateTask(taskId: task.remoteId!, map: task.toJson())
          .then((result) {
        if (result.isRight) {
          _writeInLocalAfterSyncing(result.right);
        }
      });
    } catch (e) {
      ///TODO: Complete this catch
    }
  }

  Future<void> createTask(TaskModel task) async {
    try {
      await _localTasksDatabase.writeData(task.localId, task);
      _notionDataBase.createTask(map: task.toJson()).then((result) {
        if (result.isRight) {
          _writeInLocalAfterSyncing(result.right);
        }
      });
    } catch (e) {
      ///TODO: Complete this catch
    }
  }

  Future<TaskModel> _uploadFilesNoFirebase({required TaskModel task}) async {
    if (task.files.isNotEmpty) {
      final uploadFilesResult = await _firebaseStorage.uploadFiles(task.files);
      task = task.copyWith(files: uploadFilesResult.right);
    }
    return task;
  }

  void _writeInLocalAfterSyncing(TaskModel task) {
    _localTasksDatabase.writeData(task.localId, task);
    _localUtilDatabase.setLastModificationDate();
  }
}
