import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../databases/local_databases/local_tasks_database.dart';
import '../../helpers/tasks_filtration.dart';
import '../../models/task_model/task_model.dart';
import '../../service_locator/sl.dart';
import '../../util/constance/dimens.dart';
import '../../util/constance/gaps.dart';
import '../widgets/new_task_tile.dart';
import '../widgets/task_item_design.dart';

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
                valueListenable: sl<LocalTasksDatabase>().getBox().listenable(),
                builder: (context, box, _) {
                  final tasks =
                      sl<TasksFiltration>().getDailyTasks(box.values.toList());
                  if (tasks.isEmpty) {
                    /// TODO: Change this text to image
                    return const Text('No Tasks');
                  }
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) =>
                        TaskItemDesign(task: tasks[index]),
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
