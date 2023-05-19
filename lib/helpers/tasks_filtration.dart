import 'package:taskaty/databases/auth_database.dart';

import '../../models/group_lists_model.dart';
import '../../models/task_model/task_model.dart';
import '../../models/tasks_list_model.dart';
import '../service_locator/sl.dart';
import 'date_time_util.dart';

class TasksFiltration {
  List<TaskModel> _getTasks(
      List<TaskModel> tasks, bool Function(TaskModel task) condition) {
    return tasks.where((element) => condition(element)).toList();
  }

  ///
  List<TasksListModel> _filterTasksInList(List<TaskModel> tasks,
      bool Function(TaskModel task, TaskModel comingTask) condition) {
    List<TasksListModel> lists = [];
    for (final task in tasks) {
      final list = tasks.where((element) => lists.where((e) => e.name == element.listName).isEmpty && condition(task, element)).toList();
      if (list.isNotEmpty) {
        lists.add(TasksListModel()
          ..name = list.first.listName
          ..tasks = list);
      }
    }
    return lists;
  }

  List<TaskModel> getDailyTasks(List<TaskModel> tasks) {
    return _getTasks(
        tasks,
        (task) =>
            task.addedToMyDay && DateTimeUtil.sameDay(task.dateCreated) ||
            task.repeatDaily);
  }

  TasksListModel getMyTasks(List<TaskModel> tasks) {
    dynamic myTasks = _getTasks(
        tasks, (task) => task.listName == null && task.groupName == null);
    return myTasks = TasksListModel()..tasks = myTasks;
  }

  List<TasksListModel> getTasksLists(List<TaskModel> tasks) {
    return _filterTasksInList(
        tasks,
        (task, comingTask) =>
            task.listName != null &&
            task.groupName == null &&
            task.listName == comingTask.listName);
  }

  List<GroupListsModel> getGroups(List<TaskModel> tasks,
      {bool Function(TaskModel task, TaskModel comingTask)? condition}) {
    List<GroupListsModel> groups = [];
    List<TasksListModel> list = _filterTasksInList(
        tasks,
        condition ??
            (task, comingTask) =>
                task.groupName != null &&
                task.groupName == comingTask.groupName);
    if (list.isNotEmpty) {
      groups.add(GroupListsModel()
        ..lists = list
        ..name = list.first.tasks!.first.groupName!);
    }
    return groups;
  }

  List<dynamic> getCompletedTasks(List<TaskModel> tasks) {
    final singleTasks = _getTasks(
        tasks,
        (task) =>
            task.completed && task.listName == null && task.groupName == null);
    final tasksLists = _filterTasksInList(
      tasks,
      (task, comingTask) =>
          task.completed &&
          task.groupName == null &&
          task.listName != null &&
          task.listName == comingTask.listName,
    );

    final groups = getGroups(
      tasks,
      condition: (task, comingTask) =>
          task.groupName != null &&
          task.completed &&
          task.groupName == comingTask.groupName,
    );
    return [...singleTasks, ...tasksLists, ...groups];
  }
}
