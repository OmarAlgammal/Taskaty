import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../databases/local_databases/local_tasks_database.dart';
import '../../../../helpers/tasks_utils.dart';
import '../../../../models/task_model/task_model.dart';
import '../../../../service_locator/locator.dart';
import '../../../widgets/task_item_design.dart';

class MyDayScreenTasksListComp extends StatelessWidget {
  const MyDayScreenTasksListComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<Box<TaskModel>>(
        valueListenable: locator<LocalTasksDatabase>().getBox().listenable(),
        builder: (context, box, _) {
          final tasks = box.values.toList();
          final todayTasks = TasksUtils(tasks: tasks).getCombinations().todayTasks;
          if (todayTasks.isEmpty) {
            /// TODO: Change this text to image
            return const Text('No Tasks');
          }
          return ListView.builder(
            itemCount: todayTasks.length,
            itemBuilder: (context, index) =>
                TaskItemDesign(task: todayTasks[index]),
          );
        },
      ),
    );
  }
}
