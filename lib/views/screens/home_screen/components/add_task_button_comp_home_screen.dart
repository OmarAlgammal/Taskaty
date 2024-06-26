import 'package:flutter/material.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';

import '../../../../models/task_model/task_model.dart';
import '../../../../utils/constance/border_radius.dart';
import '../../../../utils/constance/gaps.dart';
import '../../../../utils/constance/icons.dart';
import '../../../../utils/constance/my_padding.dart';
import '../../../../utils/helper/bottom_sheet_helper.dart';
import '../../../../utils/helper/date_helper.dart';
import '../../../../utils/helper/my_date_utils_helper.dart';
import '../../../widgets/calendar_widget.dart';

class AddTaskButtonCompHomeScreen extends StatefulWidget {
  AddTaskButtonCompHomeScreen({super.key, this.monthNum, this.weekNum});

  final int? monthNum, weekNum;

  @override
  State<AddTaskButtonCompHomeScreen> createState() =>
      _AddTaskButtonCompHomeScreenState();
}

class _AddTaskButtonCompHomeScreenState
    extends State<AddTaskButtonCompHomeScreen> {
  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();

  late DateTime _dueDate;

  String? _title;

  String? _description;

  DateTime? _selectedDate;

  bool _repeatDaily = false;

  @override
  void initState() {
    _dueDate =
        MyDateUtilsHelper.createCreationDate(widget.monthNum, widget.weekNum);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: MyPadding.padding8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textsFieldsComp(context),
            Row(
              children: [
                calendarComp(context),
                Gaps.gap8,
                repeatDailyComp(context),
                const Spacer(),
                addTaskButton(context),
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
                setState(() {
                _title = value.isEmpty ? null : value;
                });
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
                onChanged: (value) {
                  setState(() {
                  _description = value.isEmpty ? null : value;
                  });
                },
              ),
            ),
            Gaps.gap8,
          ],
        ),
      );

  Widget calendarComp(BuildContext context) => InkWell(
        onTap: () {
          bottomSheetHelper(
              context,
              CalendarWidget(
                dueDate: _dueDate,
                onDoneButtonPressed: () {
                  _dueDate = _selectedDate ?? _dueDate;
                  Navigator.pop(context);
                },
                onValueChanged: (value) {
                  _selectedDate = value.first;
                },
              ));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              AppIcons.calendar,
              color: DateHelper.dueDateColor(context, _dueDate),
            ),
            Gaps.gap4,
            Text(
              _dueDate.dateZone(context),
              style: context.textTheme.bodyMedium!.copyWith(
                color: DateHelper.dueDateColor(context, _dueDate),
              ),
            ),
          ],
        ),
      );

  Widget repeatDailyComp(BuildContext context) => IconButton(
        onPressed: () {
          setState(() {
          _repeatDaily = !_repeatDaily;
          });
        },
        icon: Icon(
          AppIcons.dailyRepetitionIcon,
          color: _repeatDaily ? context.colorScheme.primary : context.colorScheme.primaryContainer,
        ),
      );

  Widget addTaskButton(BuildContext context) {
    final containerColor =
        context.colorScheme.primary.withOpacity(_title == null ? .2 : 1);
    final iconColor =
        context.colorScheme.onPrimary.withOpacity(_title == null ? .2 : 1);
    return Container(
      decoration: BoxDecoration(
          color: containerColor, borderRadius: Circular.circular100),
      child: IconButton(
        disabledColor: Colors.red,
        icon: Icon(AppIcons.playArrow, color: iconColor),
        onPressed: () {
          if (_title != null) {
            final task =
                TaskModel(_title!, _description, _dueDate, _repeatDaily);
            context.taskViewModel.setTask(task);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
