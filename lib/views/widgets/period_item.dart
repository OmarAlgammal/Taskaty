import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/border_radius.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/int_extensions.dart';
import 'package:taskaty/views/screens/home_screen/components/add_task_button.dart';
import 'package:taskaty/views/widgets/single_divider.dart';
import 'package:taskaty/views/widgets/task_widget.dart';

import '../../models/task_model/task_model.dart';

class PeriodItem extends StatelessWidget {
  const PeriodItem({
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
