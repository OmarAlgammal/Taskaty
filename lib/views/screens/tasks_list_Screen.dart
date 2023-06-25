import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/helpers/tasks_utils.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/view_model/tasks_view_model/tasks_view_model.dart';
import 'package:taskaty/views/widgets/task_item_design.dart';

import '../../models/tasks_list_model.dart';
import '../../service_locator/locator.dart';
import '../../utils/constance/gaps.dart';
import '../widgets/new_task_tile.dart';

class TasksListScreen extends StatelessWidget {
  TasksListScreen({
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
          tasksList.mainTask.title ?? 'Tasks',
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
      ),
      body: Column(
        children: [
          gap16,
          Flexible(
            child: ValueListenableBuilder<Box<TaskModel>>(
              valueListenable: locator<LocalTasksDatabase>().getBox().listenable(),
              builder: (context, box, _) {
                dynamic tasks = box.values.toList();
                final tasksUtils = TasksUtils(tasks: tasks);
                debugPrint('here ${tasksList.mainTask.listName}');
                tasks = tasksList.mainTask.listName != null
                    ? tasksUtils.getSingleTasksList(
                        mainTask: tasksList.mainTask).tasks
                    : tasksUtils.getMyTasks().tasks;
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    TaskModel task = tasks[index];
                    if (task.title == null) {
                      return const SizedBox();
                    }
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return TaskItemDesign(
                          task: task,
                          onCheckBoxClicked: (value) {
                            setState(() {
                              task = task.copyWith(completed: value!);
                              locator<ViewModel>().updateTask(task);
                            });
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Flexible(
            flex: 0,
            child: AddNewTask(listName: tasksList.mainTask.title),
          ),
        ],
      ),
    );
  }
}
