import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../models/list_model.dart';
import '../../../../service_locator/locator.dart';
import '../../../../view_model/tasks_view_model/tasks_view_model.dart';

class TasksListAppBarComp extends StatelessWidget implements PreferredSizeWidget {
  const TasksListAppBarComp({Key? key, required this.tasksList}) : super(key: key);

  final ListModel tasksList;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        tasksList.mainTask.listName ?? 'Tasks',
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: () {
                // todo: reorder tasks action)
              },
              child: Text(
                'reorderTasks'.tr(),
              ),
            ),
            PopupMenuItem(
              onTap: () {
                // todo: rename list action
              },
              child: Text(
                'renameList'.tr(),
              ),
            ),
            PopupMenuItem(
              onTap: () {
                // todo: sort by action
              },
              child: Text(
                'sortBy'.tr(),
              ),
            ),
            PopupMenuItem(
              onTap: () {
                locator<ViewModel>().deleteTask(tasksList.mainTask);
                for (final task in tasksList.tasks) {
                  locator<ViewModel>().deleteTask(task);
                }
                Navigator.pop(context);
              },
              child: Text(
                'deleteList'.tr(),
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
