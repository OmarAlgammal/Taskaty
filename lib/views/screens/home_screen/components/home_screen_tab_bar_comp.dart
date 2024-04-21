import 'package:flutter/material.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/views/screens/home_screen/components/monthly_comp.dart';
import 'package:taskaty/views/screens/home_screen/components/tasks_list_comp.dart';
import 'package:taskaty/views/screens/home_screen/components/weekly_comp.dart';

class HomeScreenTabViewComp extends StatelessWidget {
  const HomeScreenTabViewComp(
      {Key? key, required this.filteredTasks})
      : super(key: key);

  final ({
  List<TaskModel> allTasks,
  List<TaskModel> dailyTasks,
  Map<int, Map<int, List<TaskModel>>> monthlyTasks
  }) filteredTasks;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: List.generate(
        context.mainTabs.length,
        (index) {
          final tab = context.mainTabs[index];
          if (tab == context.todayTab) {
            return TasksListComp(tasks: filteredTasks.dailyTasks);
          }
          if (tab == context.weeklyTab) return WeeklyComp(months: filteredTasks.monthlyTasks);
          if (tab == context.monthlyTab) {
            return MonthlyComp(monthTasks: filteredTasks.monthlyTasks);
          }
          return TasksListComp(tasks: filteredTasks.allTasks);
        },
      ),
    );
  }
}
