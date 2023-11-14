import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/views/widgets/empty_period.dart';
import 'package:taskaty/views/widgets/task_widget.dart';

import '../../../../models/task_model.dart';
import '../../../../utils/constance/dimens.dart';
import '../../../../utils/my_date_utils.dart';
import '../../../widgets/my_elevated_button.dart';

class WeeklyComp extends StatelessWidget {
  WeeklyComp({super.key, required this.months});

  final Map<int, Map<int, List<TaskModel>>> months;
  late int monthIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding16,
      child: ListView.separated(
        itemCount: 13,
        separatorBuilder: (context, monthIndex) {
          monthIndex = monthIndex + 1;
          this.monthIndex = monthIndex;
          return EmptyPeriod(monthNum: monthIndex);
        },
        itemBuilder: (context, weekIndex) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, weekIndex) {
              weekIndex = weekIndex + 1;
              final weeksTasks = months[monthIndex]![weekIndex];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // for later months
                  if (weeksTasks!.isNotEmpty ||
                      !MyDateUtils.beforeThisMonth(monthIndex))
                    Text('week $weekIndex'),
                  // for this month
                  if (weeksTasks.isEmpty && MyDateUtils.inThisMonth(monthIndex))
              MyElevatedButton(text: 'Add task to week $weekIndex in  ${MyDateUtils.getMonthAbbreviatedName(monthIndex)}', onPressed: () {},),
                  //for future months
                  if (MyDateUtils.afterThisMonth(monthIndex))
              MyElevatedButton(text: 'Add task to week $weekIndex in  ${MyDateUtils.getMonthAbbreviatedName(monthIndex)}', onPressed: () {},),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: weeksTasks.length,
                    separatorBuilder: (context, index) => gap8,
                    itemBuilder: (context, index) {
                      //return Text('Elevated button here');
                      if (weeksTasks.isEmpty &&
                          MyDateUtils.inThisMonth(monthIndex)) {
                        return MyElevatedButton(text: 'Add task to week $weekIndex in  ${MyDateUtils.getMonthAbbreviatedName(monthIndex)}', onPressed: () {},);
                      }
                      return TaskWidget(task: weeksTasks[index]);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
