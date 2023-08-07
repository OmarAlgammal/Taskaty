import 'task_model/task_model.dart';

class ListModel {
  late TaskModel mainTask;
  List<TaskModel> tasks = [];

  copyWith(ListModel list){
    return ListModel()..tasks = list.tasks..mainTask = list.mainTask;
  }
}
