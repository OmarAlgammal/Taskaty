import 'package:flutter/material.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';

class DateHelper {
  static Color dueDateColor(BuildContext context, DateTime dueDate) {
    return dueDate.isBeforeToday
        ? context.colorScheme.error
        : context.colorScheme.primary;
  }
}
