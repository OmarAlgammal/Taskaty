import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/int_extensions.dart';
import 'package:taskaty/utils/helper/my_date_utils_helper.dart';
import 'package:taskaty/views/screens/home_screen/components/add_task_button.dart';
import 'package:taskaty/views/widgets/period_item.dart';

import '../../../../models/task_model/task_model.dart';
import '../../../../utils/constance/icons.dart';

class MonthlyComp extends StatelessWidget {
  const MonthlyComp({super.key, required this.monthTasks});

  final Map<int, Map<int, List<TaskModel>>> monthTasks;
  final monthsNum = 12;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding16,
      child: ListView.separated(
        itemCount: monthsNum,
        separatorBuilder: (contexts, index) => gap8,
        itemBuilder: (context, monthIndex) {
          monthIndex = monthIndex + 1;
          final tasksInMonth = getTasksInMonth(monthTasks[monthIndex]!);
          final fromThePastMonths = MyDateUtilsHelper.fromThePastMonths(monthIndex);
          final fromTheNextMonths = MyDateUtilsHelper.fromTheNextMonths(monthIndex);
          final thisMonth = MyDateUtilsHelper.inThisMonth(monthIndex);
          // Last months
          if (fromThePastMonths && tasksInMonth.isEmpty ||
              fromTheNextMonths && tasksInMonth.isEmpty) {
            return emptyMonthWidget(
              context,
              monthIndex,
            );
          }

          // Current month or later
          return Padding(
            padding: paddingV8,
            child: PeriodItem(
              tasks: tasksInMonth,
              monthNum: monthIndex,
              fromNextMonths: fromTheNextMonths,
              thisMonth: thisMonth,
            ),
          );
        },
      ),
    );
  }

  Widget emptyMonthWidget(BuildContext context, int monthNum) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(monthNum.getMonthAbbreviatedName, style: context.textTheme.bodyMedium),
            gap8,
            const Expanded(child: Divider(height: 2, thickness: 2)),
          ],
        ),
        if (monthNum > DateTime.now().month)
          AddTaskButton(monthNum: monthsNum,),
      ],
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
