import 'package:flutter/material.dart';
import 'package:taskaty/views/widgets/buttons/add_task_button_comp.dart';

import '../../../../utils/constance/border_radius.dart';
import '../../../../utils/constance/icons.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key, this.iconColor, this.monthNum, this.weekNum});

  final int? monthNum, weekNum;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: Circular.circular16,
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return AddTaskButtonComp(
                monthNum: monthNum,
                weekNum: weekNum,
              );
            });
      },
      icon: Icon(
        AppIcons.addIcon,
        color: iconColor,
      ),
    );
  }
}
