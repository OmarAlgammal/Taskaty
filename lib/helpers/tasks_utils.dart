import 'package:flutter/cupertino.dart';
import 'package:taskaty/databases/auth_database.dart';
import 'package:taskaty/models/group_lists_model.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/models/tasks_list_model.dart';

import '../service_locator/locator.dart';
import 'date_time_util.dart';

class TasksUtils {

  List<TaskModel> tasks;
  TasksUtils({required this.tasks});

  List<TaskModel> getDailyTasks() {
    return tasks.where((task) => task.isAddedToMyDay()).toList();
  }

  TasksListModel getMyTasks() {
    final myTasks = tasks.where((task) => task.isInMyTasks()).toList();
    return TasksListModel()..tasks = myTasks
    /// TODO: Refactor this task model (remove some properties)
      ..mainTask = TaskModel(
        localId: DateTime.now().toString(),
        modificationDate: DateTime.now(),
        dateCreated: DateTime.now());
  }

  TasksListModel getSingleTasksList({required TaskModel mainTask}){
      final list = tasks.where((task) => task.isInList(mainTask.listName)).toList();
      return TasksListModel()..mainTask = mainTask..tasks = list;
  }

  List<TasksListModel> getTasksLists() {
    return _getTasksByCondition((task, comingTask) => task.isInList(comingTask.listName));
  }

  List<GroupListsModel> getGroups() {
    List<GroupListsModel> groups = [];
    final groupsWithoutTasks = _getGroupsWithoutLists();
    final tasksLists = _getTasksByCondition((task, comingTask) => task.representAListInGroup());
    for (final group in groupsWithoutTasks) {
      final listsInGroup = tasksLists
          .where((list) {
        return list.mainTask.isInGroup(group.mainTask.groupName);
      })
          .toList();
      groups.add(group..lists = listsInGroup);
    }
    return groups;
  }



  List<TasksListModel> _getTasksByCondition(bool Function(TaskModel task, TaskModel comingTask) condition){
      List<TasksListModel> lists = [];
      for (final task in tasks) {
        final list = tasks
            .where((element) =>
                // This condition to prevent repeated lists
                lists
                    .where((e) => e.mainTask.listName == element.listName)
                    .isEmpty &&
                condition(task, element))
            .toList();
        if (list.isNotEmpty) {
          lists.add(TasksListModel()
            ..mainTask = task
            ..tasks = list);
        }
      }
      return lists;
  }

  List<GroupListsModel> _getGroupsWithoutLists() {
    return tasks
        .where((task) => task.representAGroup())
        .map((e) => GroupListsModel()..mainTask = e)
        .toList();
  }

  /// TODO: Make this method to return completed single tasks and completed tasks in lists and completed tasks in groups
  List<TaskModel> getCompletedTasks(){
    return tasks.where((task) => task.isCompleted()).toList();
  }

}
