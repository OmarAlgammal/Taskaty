import 'package:flutter/material.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/view_model/tasks_view_model/use_cases/task_view_model.dart';

import '../../models/task_model.dart';
import '../../routing/routes.dart';
import '../../service_locator/locator.dart';
import '../../utils/constance/dimens.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({Key? key, required this.task, this.onCheckBoxClicked})
      : super(key: key);

  TaskModel task;
  final Function(bool? value)? onCheckBoxClicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: size0,
      visualDensity: const VisualDensity(vertical: -1),
      tileColor: context.colorScheme.onPrimary.withOpacity(.2),
      leading: SizedBox(
        height: 24,
        width: 24,
        child: Transform.scale(
          scale: 1.3,
          child: Checkbox(
              value: task.completed,
              shape: const CircleBorder(),
              activeColor: Theme.of(context).colorScheme.onPrimary,
              onChanged: onCheckBoxClicked ??
                  (value) {
                    task = task.updateTask(completed: value);
                    locator<TaskViewModel>().writeTask(task);
                  }),
        ),
      ),
      title: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.taskScreen, arguments: task);
        },
        child: Text(
          task.title,
        ),
      ),
    );
  }
}
