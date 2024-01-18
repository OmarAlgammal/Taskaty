import 'package:flutter/material.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';

import '../../../../utils/constance/dimens.dart';
import '../../../../utils/constance/icons.dart';

class DeleteCompTaskScreen extends StatelessWidget {
  const DeleteCompTaskScreen({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListTile(
        contentPadding: padding0,
        onTap: () {
          context.taskViewModel.deleteTask(task.localId).then((value) {
            Navigator.pop(context);
          });
        },
        leading: const Icon(AppIcons.deleteIcon),
        title: Text(
          task.creationDate.dateZone,
        ),
      ),
    );
  }
}
