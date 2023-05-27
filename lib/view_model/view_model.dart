

import 'package:flutter/material.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/databases/local_databases/local_utils_database.dart';
import 'package:taskaty/databases/notion_database.dart';
import 'package:taskaty/databases/storage_database.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/service_locator/sl.dart';
import 'package:taskaty/view_model/use_cases/sync_tasks_use_case.dart';

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
    sl<SyncTaskUseCase>().syncTasks();
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
      task = await _uploadFilesToFirebase(task: task);
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

  Future<void> updateGroupOfTasks(List<TaskModel> tasks) async {
    /// TODO: Refactor this try and delete files that are not in the firebase storage
    for (TaskModel task in tasks) {
      task = task.copyWith(modificationDate: DateTime.now());
    }
    for (TaskModel task in tasks) {
      await _localTasksDatabase.writeData(task.localId, task);
      debugPrint('View model : after await update task model in local tasks database ${task.groupName}');
    }

    /// TODO: Refactor this try
    // try {
    //   /// Upload files to firebase and get link to add to notion
    //   for (TaskModel task in tasks) {
    //     task = await _uploadFilesToFirebase(task: task);
    //   }
    //   for (TaskModel task in tasks) {
    //     await _localTasksDatabase.writeData(task.localId, task);
    //     debugPrint('View model : after await update task model in local tasks database');
    //   }
    //   for (TaskModel task in tasks) {
    //     _notionDataBase
    //         .updateTask(taskId: task.remoteId!, map: task.toJson())
    //         .then((result) {
    //       if (result.isRight) {
    //         _writeInLocalAfterSyncing(result.right);
    //       }
    //     });
    //   }
    // } catch (e) {
    //   debugPrint('View model: Update group tasks >> error');
    //   ///TODO: Complete this catch
    // }
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

  Future<TaskModel> _uploadFilesToFirebase({required TaskModel task}) async {
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
