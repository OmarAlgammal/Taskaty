import 'package:flutter/material.dart';
import 'package:taskaty/models/task_model/task_model.dart';

import '../../models/tasks_list_model.dart';
import '../../routing/routes.dart';
import '../../util/constance/dimens.dart';
import '../../util/constance/icons.dart';

class TasksListItemDesign extends StatelessWidget {
  const TasksListItemDesign({
    Key? key,
    required this.tasksListModel,
    this.icon = listIcon,
  }) : super(key: key);

  final TasksListModel tasksListModel;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final tasksLength = tasksListModel.tasks.length;
    final listName = tasksListModel.mainTask.listName!;
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.tasksListPage,
            arguments: tasksListModel);
      },
      horizontalTitleGap: size0,
      leading: Icon(
        icon,
      ),
      trailing: Text(tasksLength.toString()),
      title: Text(listName),
    );
  }
}
