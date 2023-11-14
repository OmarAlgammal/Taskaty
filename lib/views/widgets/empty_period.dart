import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/my_date_utils.dart';

class EmptyPeriod extends StatelessWidget {
  const EmptyPeriod({super.key, required this.monthNum});

  final int monthNum;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(MyDateUtils.getMonthAbbreviatedName(monthNum)),
        gap8,
        Expanded(child: Divider(height: 2, thickness: 2)),
      ],
    );
  }
}
