import 'package:flutter/material.dart';
import 'package:taskaty/core/database/constance/local_utils_database_keys.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/databases/local_databases/local_utils_database.dart';
import 'package:taskaty/databases/notion_database.dart';
import 'package:taskaty/databases/storage_database.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/view_model/tasks_view_model/use_cases/upload_files_to_storage_use_case.dart';

class ViewModel {
  final BaseNotionDataBase _baseNotionDataBase;

  /// TODO: Use hive data base instead of this services
  final BaseLocalTasksDatabase _baseLocalTasksDatabase;
  final BaseStorageDatabase _firebaseStorage;
  final BaseLocalUtilsDatabase _baseLocalUtilDatabase;
  final BaseUploadFilesToStorageUseCase _baseUploadFilesToStorageUseCase;

  /// TODO: use this to upload files to firebase storage then get it's link to upload to notion

  ViewModel(
    this._baseNotionDataBase,
    this._baseLocalTasksDatabase,
    this._firebaseStorage,
    this._baseLocalUtilDatabase,
    this._baseUploadFilesToStorageUseCase,
  );

  Future<void> addTask(TaskModel task) async {
    await _updateLocalData(task: task);
  }

  /// TODO: Make separated use case to update files with task
  Future<void> updateTask(TaskModel task) async {
    // Note: update task modification date here instead of update it in more than one place
    task = task.copyWith(modificationDate: DateTime.now());
    await _updateLocalData(task: task);
  }

  Future<void> deleteTask(TaskModel task) async {
    await _baseLocalTasksDatabase.deleteData(task.localId);
    if (task.remoteId != null) _baseNotionDataBase.deleteTask(taskId: task.remoteId!);
  }

  Future<void> updateGroupOfTasks(List<TaskModel> tasks) async {
    /// TODO: Refactor this try and delete files that are not in the firebase storage
    for (TaskModel task in tasks) {
      task = task.copyWith(modificationDate: DateTime.now());
    }
    for (TaskModel task in tasks) {
      await _baseLocalTasksDatabase.writeData(task.localId, task);
      debugPrint(
          'View model : after await update task model in local tasks database ${task.groupName}');
    }
  }

  Future<void> _updateLocalData({required TaskModel task}) async {
    await _baseLocalTasksDatabase.writeData(task.localId, task);
    _baseLocalUtilDatabase.setModificationDate(
        key: LocalUtilsDatabaseKeys.lastLocalModificationDate);
  }

  /// TODO: Remote this function
  Future<TaskModel> _uploadFilesToFirebase({required TaskModel task}) async {
    if (task.files.isNotEmpty) {
      final uploadFilesResult = await _firebaseStorage.uploadFiles(task.files);
      task = task.copyWith(files: uploadFilesResult.right);
    }
    return task;
  }
}
