import 'package:taskaty/models/task_model/task_model.dart';

import '../../../repositories/local_service_repos/local_tasks_repo.dart';

class TaskViewModel {
  final BaseLocalTasksRepo<TaskModel> _baseLocalTasksDatabase;

  TaskViewModel(this._baseLocalTasksDatabase);

  Future<void> writeTask(TaskModel task) async {
    await _baseLocalTasksDatabase.writeData(task.id, task);
  }

  Future<void> deleteTask(String key) async {
    await _baseLocalTasksDatabase.deleteData(key);
  }
}
