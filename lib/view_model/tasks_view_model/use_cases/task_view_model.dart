import 'package:flutter/cupertino.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/models/task_model.dart';

class TaskViewModel {
  final BaseLocalTasksDatabase<TaskModel> _baseLocalTasksDatabase;

  TaskViewModel(this._baseLocalTasksDatabase);

  Future<void> writeTask(TaskModel task) async {
    await _baseLocalTasksDatabase.writeData(task.id, task).then((value) {
    });
  }

  Future<void> deleteTask(String key) async {
    await _baseLocalTasksDatabase.deleteData(key);
  }
}
