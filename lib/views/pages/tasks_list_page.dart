import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/helpers/tasks_utils.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/view_model/view_model.dart';
import 'package:taskaty/views/widgets/task_item_design.dart';

import '../../models/tasks_list_model.dart';
import '../../service_locator/sl.dart';
import '../../util/constance/gaps.dart';
import '../widgets/new_task_tile.dart';

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
                  sl<ViewModel>().deleteTask(tasksList.mainTask);
                  for (final task in tasksList.tasks){
                      sl<ViewModel>().deleteTask(task);
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
              valueListenable: sl<LocalTasksDatabase>().getBox().listenable(),
              builder: (context, box, _) {
                return SizedBox();
                // final tasks = TasksUtils().getTasks(box.values.toList(),
                //     (TaskModel task) => task.listName == tasksList.mainTask.title);
                // return ListView.builder(
                //   itemCount: tasks.length,
                //   itemBuilder: (context, index) {
                //     TaskModel task = tasks[index];
                //     if (task.title == null) {
                //       return const SizedBox();
                //     }
                //     return StatefulBuilder(builder: (context, setState) {
                //       return TaskItemDesign(
                //         task: task,
                //         onCheckBoxClicked: (value) {
                //           setState(() {
                //             task = task.copyWith(completed: value!);
                //             sl<ViewModel>().updateTask(task);
                //           });
                //         },
                //       );
                //     });
                //   },
                // );
              },
            ),
          ),
          Flexible(
            flex: 0,
            child: AddNewTask(listName: tasksList.mainTask.title),
          )
        ],
      ),
    );
  }
}
