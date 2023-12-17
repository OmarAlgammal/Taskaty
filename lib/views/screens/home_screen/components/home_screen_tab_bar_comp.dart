import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/utils/enums/main_tabs_enum.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/views/screens/home_screen/components/monthly_comp.dart';
import 'package:taskaty/views/screens/home_screen/components/tasks_list_comp.dart';
import 'package:taskaty/views/screens/home_screen/components/weekly_comp.dart';
import 'package:taskaty/views/widgets/add_task_button_comp.dart';

import '../../../../repositories/local_service_repos/local_tasks_repo.dart';
import '../../../../service_locator/locator.dart';
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
                  builder: (context) => AddTaskButtonComp(),
                );
              },
            ),
            body: ValueListenableBuilder<Box<TaskModel>>(
              valueListenable:
                  (locator<LocalTasksRepo>().getBox()).listenable(),
              builder: (context, box, _) {
                final monthsTasks = getMonthsTasks(box.values.toList());
                return switch (tab) {
                  MainTabs.weekly => WeeklyComp(months: monthsTasks),
                  MainTabs.monthly => MonthlyComp(monthTasks: monthsTasks),
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

  List<TaskModel> getDailyTasks(Iterable<TaskModel> tasks) =>
      tasks.where((element) => element.isTodayTask).toList();

  Map<int, Map<int, List<TaskModel>>> getMonthsTasks(
      Iterable<TaskModel> tasks) {
    final tasksStructure = getTasksStructure();
    final yearTasks =
        tasks.where((task) => task.creationDate.likeThisYear).toList();
    for (int i = 0; i < yearTasks.length; i++) {
      final task = yearTasks[i];
      debugPrint('task $i id ${task.id}');
      if (task.dueDate != null) {
        final monthNumber = task.dueDate!.month;
        final weekNumber = task.dueDate!.getWeekNumberInMonth;
        tasksStructure[monthNumber]![weekNumber]!.add(task);
      }
    }
    return tasksStructure;
  }

  Map<int, Map<int, List<TaskModel>>> getTasksStructure() {
    return {
      for (int m = 1; m <= 12; m++) m: {for (int w = 1; w <= 5; w++) w: []}
    };
  }
}
