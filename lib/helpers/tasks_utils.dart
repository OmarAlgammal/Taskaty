import 'package:flutter/cupertino.dart';
import 'package:taskaty/databases/auth_database.dart';
import 'package:taskaty/models/group_lists_model.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/models/tasks_list_model.dart';

import '../service_locator/sl.dart';
import 'date_time_util.dart';

class TasksUtils {

  List<TaskModel> tasks;
  TasksUtils({required this.tasks});
  // List<TaskModel> getTasks(
  //     List<TaskModel> tasks, bool Function(TaskModel task) condition) {
  //   return tasks.where((element) => condition(element)).toList();
  // }
  //
  // List<TasksListModel> _filterTasksInList(List<TaskModel> tasks,
  //     bool Function(TaskModel task, TaskModel comingTask) condition) {
  //   List<TasksListModel> lists = [];
  //   for (final task in tasks) {
  //     final list = tasks
  //         .where((element) =>
  //             // This condition to prevent repeated lists
  //             lists
  //                 .where((e) => e.mainTask.listName == element.listName)
  //                 .isEmpty &&
  //             condition(task, element))
  //         .toList();
  //     if (list.isNotEmpty) {
  //       lists.add(TasksListModel()
  //         ..mainTask = task
  //         ..tasks = list);
  //     }
  //   }
  //   return lists;
  // }
  //
  // List<TaskModel> getDailyTasks(List<TaskModel> tasks) {
  //   return getTasks(
  //       tasks,
  //       (task) =>
  //           task.addedToMyDay && DateTimeUtil.sameDay(task.modificationDate) ||
  //           task.repeatDaily);
  // }
  //
  // TasksListModel getMyTasks(List<TaskModel> tasks) {
  //   dynamic myTasks = getTasks(
  //       tasks, (task) => task.listName == null && task.groupName == null);
  //   /// TODO: Refactor this task model (remove some properties)
  //   return myTasks = TasksListModel()
  //     ..tasks = myTasks
  //     ..mainTask = TaskModel(
  //         localId: DateTime.now().toString(),
  //         listName: 'My tasks',
  //         modificationDate: DateTime.now(),
  //         dateCreated: DateTime.now());
  // }
  //
  // List<TasksListModel> getTasksLists(List<TaskModel> tasks) {
  //   return _filterTasksInList(
  //       tasks,
  //       (task, comingTask) =>
  //           task.listName != null &&
  //           task.groupName == null &&
  //           task.listName == comingTask.listName);
  // }
  //
  // List<GroupListsModel> _getGroupsAsTasks(List<TaskModel> tasks) {
  //   return tasks.where((element) => element.groupName != null).map((e) => GroupListsModel()..mainTask = e).toList();
  // }
  //
  // List<GroupListsModel> getGroups(List<TaskModel> tasks, List<TasksListModel> tasksLists,
  //     {bool Function(TaskModel task, TaskModel comingTask)? condition}) {
  //   List<GroupListsModel> groups = [];
  //   final groupsAsTasks = _getGroupsAsTasks(tasks);
  //   debugPrint('get groups as tasks ${groupsAsTasks.length}');
  //   for (final group in groupsAsTasks){
  //     final list = tasksLists.where((TasksListModel tasksList) => group.mainTask.groupName == tasksList.mainTask.groupName).toList();
  //     groups.add(GroupListsModel()
  //       ..lists = list
  //       ..mainTask = group.mainTask);
  //   }
  //   return groups;
  // }
  //
  //
  // List<dynamic> getCompletedTasks(List<TaskModel> tasks) {
  //   final singleTasks = getTasks(
  //       tasks,
  //       (task) =>
  //           task.completed && task.listName == null && task.groupName == null);
  //   final tasksLists = _filterTasksInList(
  //     tasks,
  //     (task, comingTask) =>
  //         task.completed &&
  //         task.groupName == null &&
  //         task.listName != null &&
  //         task.listName == comingTask.listName,
  //   );
  //
  //   final groups = getGroups([],
  //     tasksLists,
  //     condition: (task, comingTask) =>
  //         task.groupName != null &&
  //         task.completed &&
  //         task.groupName == comingTask.groupName,
  //   );
  //   return [...singleTasks, ...tasksLists, ...groups];
  // }
  //

  //----------------------------------------------------------------


  List<TaskModel> getDailyTasks() {
    return tasks.where((task) => task.isAddedToMyDay()).toList();
  }

  TasksListModel getMyTasks() {
    final myTasks = tasks.where((task) => task.isInMyTasks()).toList();
    return TasksListModel()..tasks = myTasks
    /// TODO: Refactor this task model (remove some properties)
      ..mainTask = TaskModel(
        localId: DateTime.now().toString(),
        listName: 'My tasks',
        modificationDate: DateTime.now(),
        dateCreated: DateTime.now());
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


  List<TasksListModel> getTasksLists() {
    return _getTasksByCondition((task, comingTask) => task.isInList(comingTask.listName));
  }

  List<GroupListsModel> _getGroupsWithoutLists() {
    return tasks
        .where((task) => task.representAGroup())
        .map((e) => GroupListsModel()..mainTask = e)
        .toList();
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

  /// TODO: Make this method to return completed single tasks and completed tasks in lists and completed tasks in groups


  List<TaskModel> getCompletedTasks(){
    return tasks.where((task) => task.isCompleted()).toList();
  }

}
