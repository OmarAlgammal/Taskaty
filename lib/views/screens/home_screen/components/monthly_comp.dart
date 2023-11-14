import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/enums/main_tabs_enum.dart';
import 'package:taskaty/utils/my_date_utils.dart';
import 'package:taskaty/views/widgets/empty_period.dart';
import 'package:taskaty/views/widgets/my_elevated_button.dart';
import 'package:taskaty/views/widgets/period_item.dart';

import '../../../../models/task_model.dart';

class MonthlyComp extends StatelessWidget {
  const MonthlyComp({super.key, required this.monthTasks});

  final Map<int, Map<int, List<TaskModel>>> monthTasks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding16,
      child: ListView.separated(
        itemCount: 12,
        separatorBuilder: (contexts, index) => gap8,
        itemBuilder: (context, index) {
          index = index + 1;
          final month = monthTasks[index]!;
          final tasksInMonth = getTasksInMonth(month);
          if (MyDateUtils.afterThisMonth(index)) return MyElevatedButton(text: 'Add task to ${MyDateUtils.getMonthAbbreviatedName(index)}', onPressed: (){
            /// TODO: Add a task to this month
          },);
          if (tasksInMonth.isEmpty) return  EmptyPeriod(monthNum: index);
          return tasksInMonth.isEmpty
              ? ElevatedButton(
                  onPressed: () {}, child: Text('Add Task to $index'))
              : PeriodItem(tasks: tasksInMonth);
        },
      ),
    );
  }

  List<TaskModel> getTasksInMonth(Map<int, List<TaskModel>> month) {
    List<TaskModel> list = [];
    for (int w = 1; w <= 5; w++) {
      list.addAll(month[w]!);
    }
    return list;
  }

}
