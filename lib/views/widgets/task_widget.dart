import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/border_radius.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/utils/helper/date_helper.dart';
import 'package:taskaty/view_model/tasks_view_model/use_cases/task_view_model.dart';

import '../../models/task_model/task_model.dart';
import '../../routing/routes.dart';
import '../../service_locator/locator.dart';
import '../../utils/constance/dimens.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({Key? key, required this.task, this.onCheckBoxClicked, this.showTileColor = true})
      : super(key: key);

  TaskModel task;
  bool showTileColor;
  final Function(bool? value)? onCheckBoxClicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.taskScreen, arguments: task);
      },
      horizontalTitleGap: size0,
      shape: const RoundedRectangleBorder(
        borderRadius: Circular.circular8,
      ),
      visualDensity: const VisualDensity(vertical: -1),
      tileColor: showTileColor ? context.colorScheme.onPrimary.withOpacity(.2) : null,
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
                  (value){
                    task.updateTask(completed: value);
                    context.taskViewModel.writeTask(task);
                  }),
        ),
      ),
      title: Text(
        task.title,
      ),
      trailing: Text(task.dueDate!.dateZone, style: context.textTheme.bodySmall!.copyWith(
        color: task.dueDate != null ? DateHelper.dueDateColor(context, task.dueDate!) : null,
      ),),
    );
  }
}
