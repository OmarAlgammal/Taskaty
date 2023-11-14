// import 'package:taskaty/models/group_model.dart';
//
// import '../models/list_model.dart';
// import '../models/task_model/task_model.dart';
//
// class TasksUtils {
//   List<TaskModel> tasks;
//
//   TasksUtils({required this.tasks});
//
//   ({
//     List<TaskModel> completedTasks,
//     List<GroupModel> groups,
//     List<ListModel> lists,
//     ListModel myTasks,
//     List<TaskModel> todayTasks
//   }) getCombinations() {
//     List<TaskModel> todayTasks = [];
//     ListModel myTasks = ListModel()..mainTask = TaskModel();
//     List<TaskModel> completedTasks = [];
//     Map<String, ListModel> lists = {};
//     Map<String, GroupModel> groups = {};
//
//     for (final task in tasks) {
//       // Get Daily tasks
//       if (task.isTodayTask()) {
//         todayTasks.add(task);
//       }
//       // Get my tasks
//       if (task.isIndependentTask()) {
//         myTasks.tasks.add(task);
//       }
//       // Get completed tasks
//       if (task.isCompleted()) {
//         completedTasks.add(task);
//       }
//       // Add each task to it's list
//       if (task.isTaskInList()) {
//         if (lists[task.listName] == null) {
//           lists[task.listName!] = ListModel()..tasks = [task];
//         } else
//           lists[task.listName]?.tasks.add(task);
//       }
//       // Combine lists
//       if (task.isList()) {
//         if (lists[task.listName] == null) {
//           lists[task.listName!] = ListModel()..mainTask = task;
//         } else
//           lists[task.listName]!.mainTask = task;
//       }
//       // Add each list to it's group
//       if (task.isListInGroup()) {
//         if (groups[task.groupName] == null) {
//           groups[task.groupName!] = GroupModel()
//             ..lists = [lists[task.listName]!];
//         } else
//           groups[task.groupName]!.lists.add(lists[task.listName]!);
//       }
//       // Combine groups
//       if (task.isGroup()) {
//         if (groups[task.groupName] == null) {
//           groups[task.groupName!] = GroupModel()..mainTask = task;
//         } else
//           groups[task.groupName]!.mainTask = task;
//       }
//     }
//
//     return (
//       todayTasks: todayTasks,
//       myTasks: myTasks,
//       completedTasks: completedTasks,
//       lists: lists.values.toList(),
//       groups: groups.values.toList()
//     );
//   }
// }
