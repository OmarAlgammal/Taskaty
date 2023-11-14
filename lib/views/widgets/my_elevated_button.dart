import 'package:flutter/material.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/border_radius.dart';
import 'package:taskaty/view_model/tasks_view_model/use_cases/task_view_model.dart';

import '../../utils/my_date_utils.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size.fromWidth(double.maxFinite),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: Circular.circular8),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
