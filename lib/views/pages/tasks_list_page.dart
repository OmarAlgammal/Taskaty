import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../models/task_model/task_model.dart';
import '../../models/tasks_list_model.dart';
import '../../service_locator/sl.dart';
import '../../util/constance/gaps.dart';
import '../../view_model/view_model.dart';
import '../widgets/new_task_tile.dart';
import '../widgets/task_item_design.dart';

class TasksListPage extends StatelessWidget {
  TasksListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksList =
        ModalRoute.of(context)!.settings.arguments as TasksListModel;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          tasksList.name ?? 'Tasks',
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
                  // todo: delete list action
                },
                child: Text(
                  'deleteList'.tr(),
                ),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          gap16,
          Flexible(
            flex: 1,
            child: ListView.builder(
              itemCount: tasksList.tasks?.length,
              itemBuilder: (context, index) {
                TaskModel task = tasksList.tasks![index];
                if (task.title == null) {
                  return const SizedBox();
                }
                return StatefulBuilder(builder: (context, setState) {
                  return TaskItemDesign(
                    task: task,
                    onCheckBoxClicked: (value) {
                      setState(() {
                        task = task.copyWith(completed: value!);
                        sl<ViewModel>().updateTask(task);
                      });
                    },
                  );
                });
              },
            ),
          ),
          Flexible(
            flex: 0,
            // todo: task list name
            child: AddNewTask(listName: tasksList.name),
          )
        ],
      ),
    );
  }
}
