import 'package:flutter/material.dart';

import '../../models/task_model/task_model.dart';
import '../../routing/routes.dart';
import '../../service_locator/locator.dart';
import '../../utils/constance/dimens.dart';
import '../../view_model/tasks_view_model/tasks_view_model.dart';

class TaskItemDesign extends StatelessWidget {
  TaskItemDesign({Key? key, required this.task, this.onCheckBoxClicked})
      : super(key: key);

  TaskModel task;
  final Function(bool? value)? onCheckBoxClicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: size0,
      visualDensity: const VisualDensity(vertical: -1),
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
                    task.completed = value!;
                    locator<ViewModel>().updateTask(task);
                  }),
        ),
      ),
      title: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.taskScreen, arguments: task);
        },
        child: Text(
          task.title!,
        ),
      ),
    );
  }
}
