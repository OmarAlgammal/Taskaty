import 'task_model/task_model.dart';

class TasksListModel {
  late TaskModel mainTask;
  List<TaskModel> tasks = [];

  copyWith(TasksListModel tasksList){
    return TasksListModel()..tasks = tasksList.tasks..mainTask = tasksList.mainTask;
  }
}
