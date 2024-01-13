import 'package:flutter/material.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/border_radius.dart';

import '../../../utils/helper/my_date_utils_helper.dart';

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
