import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';

import '../../../../utils/constance/icons.dart';
import '../../../../utils/helper/bottom_sheet_helper.dart';
import '../../../../utils/helper/date_helper.dart';
import '../../../widgets/calendar_widget.dart';

class OptionsCompTaskScreen extends StatelessWidget {
  OptionsCompTaskScreen(
      {super.key, required this.task, required this.onRepeatButtonClicked});

  final TaskModel task;
  DateTime? _dueDate;
  final void Function() onRepeatButtonClicked;

  @override
  Widget build(BuildContext context) {
    final dueDateColor = task.dueDate != null
        ? DateHelper.dueDateColor(context, task.dueDate!)
        : null;
    final repeatDailyColor = task.repeatDaily
        ? context.colorScheme.primary
        : context.colorScheme.primaryContainer;
    return Column(
      children: [
        if (task.dueDate != null)
          ListTile(
            title: Text(
              task.dueDate != null ? task.dueDate!.dateZone(context) : '',
              style: context.textTheme.bodyLarge!.copyWith(color: dueDateColor),
            ),
            leading: Icon(
              AppIcons.calendar,
              color: dueDateColor,
            ),
            horizontalTitleGap: 0,
            onTap: () {
              bottomSheetHelper(
                context,
                CalendarWidget(
                  dueDate: _dueDate,
                  onValueChanged: (value) {
                    _dueDate = value.first;
                  },
                  onDoneButtonPressed: () {
                    task.updateTask(dueDate: _dueDate);
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
        ListTile(
            title: Text(
              AppLocal.repeatDaily.getString(context),
              style: context.textTheme.bodyLarge!.copyWith(
                  color: repeatDailyColor, fontWeight: FontWeight.bold),
            ),
            leading: Icon(
              AppIcons.dailyRepetitionIcon,
              color: repeatDailyColor,
            ),
            horizontalTitleGap: 8.0,
            onTap: onRepeatButtonClicked),
      ],
    );
  }
}
