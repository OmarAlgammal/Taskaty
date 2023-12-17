import 'package:flutter/material.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/utils/constance/border_radius.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/utils/helper/bottom_sheet_helper.dart';
import 'package:taskaty/utils/helper/date_helper.dart';
import 'package:taskaty/utils/helper/my_date_utils_helper.dart';
import 'package:taskaty/views/widgets/calendar_widget.dart';

import '../../utils/constance/dimens.dart';

class AddTaskButtonComp extends StatefulWidget {
  const AddTaskButtonComp({super.key, this.monthNum, this.weekNum});

  final int? monthNum, weekNum;

  @override
  State<AddTaskButtonComp> createState() => _AddTaskButtonCompState();
}

class _AddTaskButtonCompState extends State<AddTaskButtonComp> {
  DateTime? dueDate;
  DateTime? selectedDate;

  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  TaskModel? task;

  bool repeatDaily = false;

  @override
  Widget build(BuildContext context) {
    dueDate = dueDate ??
        MyDateUtilsHelper.createCreationDate(widget.monthNum, widget.weekNum);
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: padding8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textsFieldsComp(context),
            actionsComp(context),
          ],
        ),
      ),
    );
  }

  Widget textsFieldsComp(BuildContext context) => Form(
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'newTask',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  if (value.trim().isNotEmpty) {
                    task = TaskModel(
                      titleController.text,
                      descriptionController.text,
                      dueDate,
                      repeatDaily,
                    );
                  } else {
                    task = null;
                  }
                });
              },
            ),
            SizedBox(
              height: 18,
              child: TextFormField(
                controller: descriptionController,
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

  Widget actionsComp(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            bottomSheetHelper(
                context,
                CalendarWidget(
                  dueDate: dueDate,
                  onDoneButtonPressed: (){
                    dueDate = selectedDate;
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
                color: DateHelper.dueDateColor(context, dueDate!),
              ),
              gap4,
              Text(
                dueDate!.dateZone,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: DateHelper.dueDateColor(context, dueDate!),
                ),
              ),
            ],
          ),
        ),
        gap8,
        IconButton(
          onPressed: () {
            setState(() {
              repeatDaily = !repeatDaily;
            });
          },
          icon: Icon(
            AppIcons.dailyRepetitionIcon,
            color: repeatDaily ? context.colorScheme.onPrimary : null,
          ),
        ),
        const Spacer(),
        addTaskButton(context, task),
      ],
    );
  }

  Widget addTaskButton(BuildContext context, TaskModel? task) {
    final containerColor =
        context.colorScheme.onPrimary.withOpacity(task == null ? .2 : 1);
    final iconColor =
        context.colorScheme.primary.withOpacity(task == null ? .2 : 1);
    return Container(
      decoration: BoxDecoration(
          color: containerColor, borderRadius: Circular.circular100),
      child: IconButton(
        disabledColor: Colors.red,
        icon: Icon(AppIcons.playArrow, color: iconColor),
        onPressed: () {
          if (task != null) {
            context.taskViewModel.writeTask(task);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
