import 'package:flutter/material.dart';

import '../../models/tasks_list_model.dart';
import '../../routing/routes.dart';
import '../../util/constance/dimens.dart';
import '../../util/constance/icons.dart';

class TasksListItemDesign extends StatelessWidget {
  const TasksListItemDesign({
    Key? key,
    required this.tasksList,
    this.icon = listIcon,
  }) : super(key: key);

  final TasksListModel tasksList;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.tasksListPage,
            arguments: tasksList);
      },
      horizontalTitleGap: size0,
      leading: Icon(
        icon,
      ),
      trailing: Text(
        tasksList.name != null ? (tasksList.tasks!.length - 1).toString() : tasksList.tasks!.length.toString(),
      ),
      title: Text(
        tasksList.name ?? 'Tasks',
      ),
    );
  }
}
