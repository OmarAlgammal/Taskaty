import 'package:flutter/material.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/utils/helper/my_date_utils_helper.dart';

import '../../../../models/task_model/task_model.dart';
import '../../../../utils/constance/border_radius.dart';
import '../../../../utils/constance/dimens.dart';
import '../../../../utils/constance/gaps.dart';
import '../../../../utils/constance/icons.dart';
import '../../../../utils/helper/bottom_sheet_helper.dart';
import '../../../../utils/helper/date_helper.dart';
import '../../../widgets/calendar_widget.dart';

class AddTaskButtonCompHomeScreen extends StatefulWidget {
  const AddTaskButtonCompHomeScreen({super.key, this.monthNum, this.weekNum});

  final int? monthNum, weekNum;

  @override
  State<AddTaskButtonCompHomeScreen> createState() =>
      _AddTaskButtonCompHomeScreenState();
}

class _AddTaskButtonCompHomeScreenState
    extends State<AddTaskButtonCompHomeScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  late DateTime dueDate;
  DateTime? selectedDate;
  TaskModel? task;

  bool repeatDaily = false;

  @override
  void initState() {
    dueDate = MyDateUtilsHelper.createCreationDate(widget.monthNum, widget.weekNum);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: padding8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textsFieldsComp(context),
            Row(
              children: [
                calendarComp(),
                gap8,
                repeatDailyComp(),
                const Spacer(),
                addTaskButton(context, task),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget textsFieldsComp(BuildContext context) => Form(
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'newTask',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              height: 18,
              child: TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'description',
                  border: InputBorder.none,
                ),
              ),
            ),
            gap8,
          ],
        ),
      );

  Widget calendarComp() => InkWell(
        onTap: () {
          bottomSheetHelper(
              context,
              CalendarWidget(
                dueDate: dueDate,
                onDoneButtonPressed: () {
                  dueDate = selectedDate ?? dueDate;
                  Navigator.pop(context);
                },
                onValueChanged: (value) {
                  selectedDate = value.first;
                },
              ));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              AppIcons.calendar,
              color: DateHelper.dueDateColor(context, dueDate),
            ),
            gap4,
            Text(
              dueDate.dateZone,
              style: context.textTheme.bodyMedium!.copyWith(
                color: DateHelper.dueDateColor(context, dueDate),
              ),
            ),
          ],
        ),
      );

  Widget repeatDailyComp() => IconButton(
        onPressed: () {
          setState(() {
            repeatDaily = !repeatDaily;
          });
        },
        icon: Icon(
          AppIcons.dailyRepetitionIcon,
          color: repeatDaily ? context.colorScheme.primary : null,
        ),
      );

  Widget addTaskButton(BuildContext context, TaskModel? task) {
    final containerColor =
        context.colorScheme.primary.withOpacity(task == null ? .2 : 1);
    final iconColor =
        context.colorScheme.onPrimary.withOpacity(task == null ? .2 : 1);
    return Container(
      decoration: BoxDecoration(
          color: containerColor, borderRadius: Circular.circular100),
      child: IconButton(
        disabledColor: Colors.red,
        icon: Icon(AppIcons.playArrow, color: iconColor),
        onPressed: () {
          if (task != null) {
            context.taskViewModel.setTask(task);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
