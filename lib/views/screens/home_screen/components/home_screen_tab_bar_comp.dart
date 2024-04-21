import 'package:flutter/material.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/views/screens/home_screen/components/monthly_comp.dart';
import 'package:taskaty/views/screens/home_screen/components/tasks_list_comp.dart';
import 'package:taskaty/views/screens/home_screen/components/weekly_comp.dart';

class HomeScreenTabViewComp extends StatelessWidget {
  const HomeScreenTabViewComp(
      {Key? key, required this.tasks})
      : super(key: key);

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: List.generate(
        context.mainTabs.length,
        (index) {
          final tab = context.mainTabs[index];
          final monthsTasks = getMonthsTasks(tasks);
          if (tab == context.todayTab) {
            return TasksListComp(tasks: getDailyTasks(tasks));
          }
          if (tab == context.weeklyTab) return WeeklyComp(months: monthsTasks);
          if (tab == context.monthlyTab) {
            return MonthlyComp(monthTasks: monthsTasks);
          }
          return TasksListComp(tasks: tasks);
        },
      ),
    );
  }

  /// TODO: Transfer this method to a separate file
  List<TaskModel> getDailyTasks(Iterable<TaskModel> tasks) =>
      tasks.where((element) => element.isTodayTask).toList();

  /// TODO: Transfer this method to a separate file
  Map<int, Map<int, List<TaskModel>>> getMonthsTasks(
      Iterable<TaskModel> tasks) {
    final tasksStructure = getTasksStructure();
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

  /// TODO: Transfer this method to a separate file
  Map<int, Map<int, List<TaskModel>>> getTasksStructure() {
    return {
      for (int m = 1; m <= 12; m++) m: {for (int w = 1; w <= 5; w++) w: []}
    };
  }
}
