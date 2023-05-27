

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/helpers/tasks_utils.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/models/tasks_list_model.dart';
import 'package:taskaty/service_locator/sl.dart';
import 'package:taskaty/util/constance/dimens.dart';
import 'package:taskaty/views/widgets/group_component.dart';
import 'package:taskaty/views/widgets/task_item_design.dart';
import 'package:taskaty/views/widgets/tasks_list_item_design.dart';

class CompletedTasksPage extends StatefulWidget {
  const CompletedTasksPage({Key? key}) : super(key: key);

  @override
  _CompletedTasksPageState createState() => _CompletedTasksPageState();
}

class _CompletedTasksPageState extends State<CompletedTasksPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: padding8,
        child: ValueListenableBuilder<Box<TaskModel>>(
          valueListenable: sl<LocalTasksDatabase>().getBox().listenable(),
          builder: (context, box, _) {
            final tasks = box.values.toList();
            final completedTasks = TasksUtils(tasks: tasks).getCompletedTasks();
            /// TODO: Refactor this
            if (completedTasks.isEmpty) {
              return const Center(child: Text('No Completed Tasks'));
            }
            return ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                /// TODO: Refactor this
                return TaskItemDesign(task: completedTasks[index]);
                // final taskType = completedTasks[index];
                // if (taskType is TaskModel) {
                //   return TaskItemDesign(task: taskType);
                // } else if (taskType is TasksListModel) {
                //   return TasksListItemDesign(tasksListModel: taskType);
                // } else {
                //   return GroupItemDesign(group: taskType, lists: const [],);
                // }
              },
            );
          },
        ),
      ),
    );
  }
}
