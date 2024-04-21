import 'package:taskaty/utils/extensions/date_time_extension.dart';

import '../../models/task_model/task_model.dart';

class TasksFiltrationHelper {
  static ({
    List<TaskModel> allTasks,
    List<TaskModel> dailyTasks,
    Map<int, Map<int, List<TaskModel>>> monthlyTasks
  }) getFilteredTasks(List<TaskModel> tasks) {
    return (
      allTasks: tasks,
      dailyTasks: _getFilteredDailyTasks(tasks),
      monthlyTasks: _getFilteredMonthlyTasks(tasks)
    );
  }

  static List<TaskModel> completedTasks(List<TaskModel> tasks) =>
      tasks.where((element) => element.completed).toList();

  static List<TaskModel> unCompletedTasks(List<TaskModel> tasks) =>
      tasks.where((element) => !element.completed).toList();

  static List<TaskModel> flattenTasksByWeekInMonth(Map<int, List<TaskModel>> month) {
    List<TaskModel> list = [];
    for (int w = 1; w <= 5; w++) {
      list.addAll(month[w]!);
    }
    return list;
  }

  static Map<int, Map<int, List<TaskModel>>> _getFilteredMonthlyTasks(
      Iterable<TaskModel> tasks) {
    final tasksStructure = _getTasksStructure();
    final yearTasks =
        tasks.where((task) => task.creationDate.likeThisYear).toList();
    for (int i = 0; i < yearTasks.length; i++) {
      final task = yearTasks[i];
      if (task.dueDate != null) {
        final monthNumber = task.dueDate!.month;
        final weekNumber = task.dueDate!.getWeekNumberInMonth;
        tasksStructure[monthNumber]![weekNumber]!.add(task);
      }
    }
    return tasksStructure;
  }

  static Map<int, Map<int, List<TaskModel>>> _getTasksStructure() {
    return {
      for (int m = 1; m <= 12; m++) m: {for (int w = 1; w <= 5; w++) w: []}
    };
  }

  static List<TaskModel> _getFilteredDailyTasks(Iterable<TaskModel> tasks) =>
      tasks.where((element) => element.isTodayTask).toList();
}
