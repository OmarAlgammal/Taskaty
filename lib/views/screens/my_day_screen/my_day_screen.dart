

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/helpers/tasks_utils.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/views/widgets/new_task_tile.dart';
import 'package:taskaty/views/widgets/task_item_design.dart';

class MyDayPage extends StatelessWidget {
  const MyDayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: padding8,
        child: Column(
          children: [
            gap16,
            Expanded(
              child: ValueListenableBuilder<Box<TaskModel>>(
                valueListenable: locator<LocalTasksDatabase>().getBox().listenable(),
                builder: (context, box, _) {
                  final tasks =  box.values.toList();
                  final dailyTasks = TasksUtils(tasks: tasks).getDailyTasks();
                  if (dailyTasks.isEmpty) {
                    /// TODO: Change this text to image
                    return const Text('No Tasks');
                  }
                  return ListView.builder(
                    itemCount: dailyTasks.length,
                    itemBuilder: (context, index) =>
                        TaskItemDesign(task: dailyTasks[index]),
                  );
                },
              ),
            ),

            /// TODO: Change this widget name
            AddNewTask(addToMyDayState: true),
          ],
        ),
      ),
    );
  }
}
