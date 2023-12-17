import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import '../../utils/constance/icons.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key, this.dueDate, this.onDoneButtonPressed, this.onValueChanged});

  final DateTime? dueDate;
  final Function(List<DateTime?>)? onValueChanged;
  final VoidCallback? onDoneButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(AppIcons.cancel)),
            IconButton(
                onPressed: onDoneButtonPressed ?? (){
                  Navigator.pop(context);
                },
                icon: const Icon(AppIcons.done)),
          ],
        ),
        CalendarDatePicker2(
          value: [dueDate ?? DateTime.now()],
          config: CalendarDatePicker2Config(),
          onValueChanged: onValueChanged,
        ),
      ],
    );
  }
}
