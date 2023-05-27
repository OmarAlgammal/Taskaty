import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/databases/local_databases/local_utils_database.dart';
import 'package:taskaty/databases/notion_database.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/service_locator/sl.dart';

class SyncTaskUseCase {
  Future<void> syncTasks() async {
    Future.wait([
      _uploadTasks(),
      _updateTasks(),
    ]);
  }

  Future<void> _updateTasks() async {
    final tasksToUpdate = _getTasksToUpdateInNotion();
    for (final task in tasksToUpdate) {
      await sl<NotionDataBase>()
          .updateTask(taskId: task.remoteId!, map: task.toJson())
          .then((result) {
        if (result.isRight) {
          _writeInLocalAfterSyncing(result.right);
        }
      });
    }
  }

  Future<void> _uploadTasks() async {
    final tasksToUpload = _getTasksDidNotUploadedToNotion();
    for (final task in tasksToUpload) {
      await sl<NotionDataBase>().createTask(map: task.toJson()).then((result) {
        if (result.isRight) {
          _writeInLocalAfterSyncing(result.right);
        }
      });
    }
  }

  DateTime _getLastModificationDate() {
    return sl<LocalUtilsDatabase>().getLastDateModification() ??
        DateTime.parse('2000-01-01');
  }

  List<TaskModel> _getTasksDidNotUploadedToNotion() {
    return sl<LocalTasksDatabase>()
        .getList(query: (task) => task.remoteId == null);
  }

  List<TaskModel> _getTasksToUpdateInNotion() {
    return sl<LocalTasksDatabase>().getList(
        query: (task) =>
            task.remoteId != null &&
            task.modificationDate.isAfter(_getLastModificationDate()));
  }

  void _writeInLocalAfterSyncing(TaskModel task) {
    sl<LocalTasksDatabase>().writeData(task.localId, task);
    sl<LocalUtilsDatabase>().setLastModificationDate();
  }
}
