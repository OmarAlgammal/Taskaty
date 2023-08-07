import 'package:flutter/material.dart';
import 'package:taskaty/models/task_model/task_model.dart';

import '../../models/list_model.dart';
import '../../routing/routes.dart';
import '../../utils/constance/dimens.dart';
import '../../utils/constance/icons.dart';

class TasksListItemDesign extends StatelessWidget {
  const TasksListItemDesign({
    Key? key,
    required this.list,
    this.icon = listIcon,
  }) : super(key: key);

  final ListModel list;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final tasksLength = list.tasks.length;
    final listName = list.mainTask.listName ?? 'My Tasks';

    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.tasksListScreen,
            arguments: list);
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
