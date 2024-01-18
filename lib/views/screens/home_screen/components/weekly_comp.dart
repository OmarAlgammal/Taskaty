import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/utils/extensions/int_extensions.dart';
import 'package:taskaty/views/screens/home_screen/components/add_task_button.dart';
import 'package:taskaty/views/widgets/task/task_widget.dart';

import '../../../../models/task_model/task_model.dart';
import '../../../../utils/constance/dimens.dart';
import '../../../../utils/helper/my_date_utils_helper.dart';
import '../../../widgets/buttons/my_elevated_button.dart';

class WeeklyComp extends StatelessWidget {
  WeeklyComp({super.key, required this.months});

  final Map<int, Map<int, List<TaskModel>>> months;

  final monthsNum = 12;
  final weeksNum = 5;

  final ScrollController _weekScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding16,
      child: ListView.separated(
        itemCount: monthsNum,
        itemBuilder: (context, monthIndex) {
          monthIndex = monthIndex + 1;
          final emptyMonth = months[monthIndex]!
              .values
              .where((week) => week.isNotEmpty)
              .toList()
              .isEmpty;
// List for each week
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              emptyMonth ? gap4 : gap8,
              monthTitleWidget(context, monthIndex, emptyMonth),
              emptyMonth ? gap0 : gap8,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // Calculate weeks in month 4 or 5
                itemCount:
                    (DateTime(DateTime.now().year, monthIndex).daysInMonth /
                                7) >
                            4
                        ? 5
                        : 4,
                itemBuilder: (context, weekIndex) {
                  weekIndex = weekIndex + 1;
                  final weeksTasks = months[monthIndex]![weekIndex];
                  final thisWeek = MyDateUtilsHelper.inThisWeek(
                      monthNum: monthIndex, weekNum: weekIndex);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      weekTitleWidget(context, monthIndex, weekIndex, thisWeek,
                          weeksTasks!.isEmpty),
// List for each week tasks
                      ListView.separated(
                        controller: _weekScrollController,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: weeksTasks.length,
                        separatorBuilder: (context, index) => gap8,
                        itemBuilder: (context, index) {
                          return TaskWidget(task: weeksTasks[index]);
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => gap16,
      ),
    );
  }


  monthTitleWidget(BuildContext context, int monthNum, bool emptyMonth) {
    return Row(
      children: [
        Text(
          monthNum.getMonthAbbreviatedName,
          style: emptyMonth
              ? context.textTheme.bodyMedium
              : context.textTheme.headlineSmall,
        ),
        gap8,
        if (emptyMonth) const Expanded(child: Divider(height: 2, thickness: 2)),
      ],
    );
  }

  weekTitleWidget(BuildContext context, int monthIndex, int weekIndex,
      bool thisWeek, bool weekIsEmpty) {
    return weekIsEmpty & !MyDateUtilsHelper.thisMonthOrLater(monthIndex)
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              thisWeek ? gap8 : gap4,
              Padding(
                padding: paddingH16,
                child: Row(
                  children: [
                    if (MyDateUtilsHelper.thisWeekOrLater(monthIndex, weekIndex))
                      AddTaskButton(monthNum: monthIndex, weekNum: weekIndex, iconColor: thisWeek
                          ? context.colorScheme.onPrimary
                          : null),
                    Text(
                      'week $weekIndex',
                      style: thisWeek
                          ? context.textTheme.titleLarge!
                              .copyWith(color: context.colorScheme.onPrimary)
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  void _scrollToIndex() {
    // Use the animateTo method of the inner ScrollController to smoothly scroll to the specified index
    _weekScrollController.animateTo(
      3 * 50.0, // Adjust the multiplier based on the height of each item
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
