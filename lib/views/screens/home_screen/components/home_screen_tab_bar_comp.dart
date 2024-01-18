import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/utils/enums/main_tabs_enum.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/views/screens/home_screen/components/monthly_comp.dart';
import 'package:taskaty/views/screens/home_screen/components/tasks_list_comp.dart';
import 'package:taskaty/views/screens/home_screen/components/weekly_comp.dart';
import 'package:taskaty/views/widgets/buttons/add_task_button_comp.dart';

import '../../../../utils/constance/icons.dart';

class HomeScreenTabViewComp extends StatelessWidget {
  const HomeScreenTabViewComp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: List.generate(
        MainTabs.values.length,
        (index) {
          final tab = MainTabs.values[index];
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(
                AppIcons.addIcon,
                color: context.colorScheme.onPrimary,
              ),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => const AddTaskButtonComp(),
                );
              },
            ),
            body: context.taskViewModel.getTasksSource().isRight
                ? StreamBuilder(
                    stream: context.taskViewModel.getTasksSource().right,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting){
                        return const Center(child: Text('Loading'));
                      }
                      if (snapshot.connectionState == ConnectionState.none && snapshot.data!.isNotEmpty){
                        return const Center(child: Text('Error'));
                      }
                      final tasks = snapshot.data!;
                      final monthsTasks = getMonthsTasks(tasks);
                      return switch (tab) {
                        MainTabs.weekly => WeeklyComp(months: monthsTasks),
                        MainTabs.monthly =>
                          MonthlyComp(monthTasks: monthsTasks),
                        _ => TasksListComp(
                            tab: tab,
                            tasks: tab == MainTabs.today
                                ? getDailyTasks(tasks)
                                : tasks),
                      };
                    },
                  )
                : ValueListenableBuilder<Box<TaskModel>>(
                    valueListenable: context.taskViewModel
                        .getTasksSource()
                        .left
                        .listenable(),
                    builder: (context, box, _) {
                      final monthsTasks = getMonthsTasks(box.values.toList());
                      return switch (tab) {
                        MainTabs.weekly => WeeklyComp(months: monthsTasks),
                        MainTabs.monthly =>
                          MonthlyComp(monthTasks: monthsTasks),
                        _ => TasksListComp(
                            tab: tab,
                            tasks: tab == MainTabs.today
                                ? getDailyTasks(box.values.toList())
                                : box.values.toList()),
                      };
                    },
                  ),
          );
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
