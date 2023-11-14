import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/models/task_model.dart';
import 'package:taskaty/utils/enums/main_tabs_enum.dart';
import 'package:taskaty/views/screens/home_screen/components/monthly_comp.dart';
import 'package:taskaty/views/screens/home_screen/components/weekly_comp.dart';
import 'package:taskaty/views/widgets/task_widget.dart';

import '../../../../service_locator/locator.dart';
import '../../../../view_model/tasks_view_model/use_cases/task_view_model.dart';

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
            floatingActionButton: tab == MainTabs.today || tab == MainTabs.all
                ? FloatingActionButton(
                    onPressed: () {
                      locator<TaskViewModel>().writeTask(TaskModel('_title',
                          '_note', DateTime.now(), true, DateTime(2023, 11, 29)));
                    },
                    child: const Icon(Icons.add),
                  )
                : null,
            body: ValueListenableBuilder<Box<TaskModel>>(
              valueListenable:
                  (locator<LocalTasksDatabase>().getBox()).listenable(),
              builder: (context, box, _) {
                final monthsTasks = getTasks(box.values.toList());

                return switch(tab){
                  MainTabs.weekly => WeeklyComp(months: monthsTasks),
                MainTabs.monthly => MonthlyComp(monthTasks: monthsTasks),
                 _ => Text('Task'),
                };
                return MonthlyComp(monthTasks: monthsTasks);
                // final todayTasks =
                //     box.values.where((element) => element.isTodayTask).toList();
                // final allTasks = box.values.toList();
                // final tab =
                //     MainTabs.values[DefaultTabController.of(context).index];
                // final itemCountLength = switch (tab) {
                //   MainTabs.today => todayTasks.length,
                //   MainTabs.weekly => 12 * 5,
                //   MainTabs.monthly => 12,
                //   MainTabs.all => allTasks.length,
                // };
                // return Padding(
                //   padding: const EdgeInsets.fromLTRB(8, 24, 8, 0),
                //   child: ListView.separated(
                //     itemCount: itemCountLength,
                //     separatorBuilder: (context, index) => gap4,
                //     itemBuilder: (context, index) {
                //       switch (tab) {
                //         case MainTabs.today:
                //           return TaskWidget(task: todayTasks[index]);
                //         case MainTabs.all:
                //           return TaskWidget(task: allTasks[index]);
                //         default:
                //         return PeriodItem(map: monthsTasks);
                //       }
                //     },
                //   ),
                // );
              },
            ),
          );
        },
      ),
    );
  }

  Map<int, Map<int, List<TaskModel>>> getTasks(Iterable<TaskModel> tasks) {
    final tasksStructure = getTasksStructure();
    final yearTasks = tasks.where((task) => task.thisSameYear()).toList();
    for (int i = 0; i < yearTasks.length; i++) {
      final task = yearTasks[i];
      final monthNumber = task.getMonthNumber;
      final weekNumber = task.getWeekNumberInMonth();
      debugPrint('week number here is $weekNumber');
      tasksStructure[monthNumber]![weekNumber]!.add(task);
    }
    return tasksStructure;
  }

  Map<int, Map<int, List<TaskModel>>> getTasksStructure() {
    return {
      for (int m = 1; m <= 12; m++) m: {for (int w = 1; w <= 5; w++) w: []}
    };
  }

  // List<List<TaskModel>> getWeeks(
  //     Map<int, Map<int, List<TaskModel>>> map) {
  //   List<List<TaskModel>> list = [];
  //
  //   for (int m = 1; m <= 12; m++) {
  //     for (int w = 1; w <= 5; w++) {
  //       list.add(map[m]![w]!);
  //     }
  //   }
  //   return list;
  // }
}
