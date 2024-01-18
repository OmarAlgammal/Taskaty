import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/int_extensions.dart';
import 'package:taskaty/utils/helper/my_date_utils_helper.dart';
import 'package:taskaty/views/screens/home_screen/components/add_task_button.dart';

import '../../../../models/task_model/task_model.dart';
import '../../../../utils/constance/border_radius.dart';
import '../../../widgets/single_divider.dart';
import '../../../widgets/task/task_widget.dart';

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
          final fromThePastMonths =
              MyDateUtilsHelper.fromThePastMonths(monthIndex);
          final fromTheNextMonths =
              MyDateUtilsHelper.fromTheNextMonths(monthIndex);
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
            child: MonthlyPeriodComp(
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

  /// TODO: Transfer this method to a new layer
  Widget emptyMonthWidget(BuildContext context, int monthNum) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(monthNum.getMonthAbbreviatedName,
                style: context.textTheme.bodyMedium),
            gap8,
            const Expanded(child: Divider(height: 2, thickness: 2)),
          ],
        ),
        if (monthNum > DateTime.now().month)
          AddTaskButton(
            monthNum: monthsNum,
          ),
      ],
    );
  }

  /// TODO: Transfer this method to a new layer
  List<TaskModel> getTasksInMonth(Map<int, List<TaskModel>> month) {
    List<TaskModel> list = [];
    for (int w = 1; w <= 5; w++) {
      list.addAll(month[w]!);
    }
    return list;
  }
}

class MonthlyPeriodComp extends StatelessWidget {
  const MonthlyPeriodComp({
    super.key,
    required this.tasks,
    required this.monthNum,
    required this.fromNextMonths,
    required this.thisMonth,
  });

  final int monthNum;
  final List<TaskModel> tasks;
  final bool fromNextMonths;
  final bool thisMonth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  monthNum.getMonthAbbreviatedName,
                  style: thisMonth
                      ? context.textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold)
                      : context.textTheme.bodyMedium,
                ),
                if (thisMonth || fromNextMonths)
                  AddTaskButton(monthNum: monthNum),
              ],
            ),
            gap8,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: tasks.isNotEmpty
                      ? context.colorScheme.onPrimary.withOpacity(.2)
                      : null,
                  borderRadius: Circular.circular16,
                ),
                child: ListView.separated(
                  itemCount: tasks.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SingleDivider(
                    color: context.colorScheme.background,
                  ),
                  itemBuilder: (context, index) => SizedBox(
                    height: 48,
                    child: ListTileTheme(
                      horizontalTitleGap: 0,
                      child: TaskWidget(
                        task: tasks[index],
                        showTileColor: false,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        gap12,
      ],
    );
  }
}
