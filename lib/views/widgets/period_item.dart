import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/border_radius.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/views/widgets/task_widget.dart';

import '../../models/task_model.dart';

class PeriodItem extends StatelessWidget {
  const PeriodItem({super.key, required this.tasks});

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sat'),
        gap8,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: context.colorScheme.onPrimary.withOpacity(.2),
              borderRadius: Circular.circular16,
            ),
            child: ListView.builder(
              itemCount: tasks.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SizedBox(
                height: 48,
                child: ListTileTheme(
                  horizontalTitleGap: 0,
                  child: TaskWidget(task: tasks[index]),
                  // CheckboxListTile(
                  //   title: Text('title'),
                  //   contentPadding: padding0,
                  //   side: BorderSide.none,
                  //   checkboxShape: const CircleBorder(),
                  //   tristate: true,
                  //   controlAffinity: ListTileControlAffinity.leading,
                  //   value: true,
                  //   onChanged: (value) {},
                  // ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
