import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../databases/local_databases/local_tasks_database.dart';
import '../../helpers/tasks_filtration.dart';
import '../../models/task_model/task_model.dart';
import '../../models/tasks_list_model.dart';
import '../../service_locator/sl.dart';
import '../../util/constance/dimens.dart';
import '../widgets/group_item_design.dart';
import '../widgets/task_item_design.dart';
import '../widgets/tasks_list_item_design.dart';

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
            final completedTasks =
                sl<TasksFiltration>().getCompletedTasks(box.values.toList());
            if (completedTasks.isEmpty) {
              return const Center(child: Text('No Completed Tasks'));
            }
            return ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                final taskType = completedTasks[index];
                if (taskType is TaskModel) {
                  return TaskItemDesign(task: taskType);
                } else if (taskType is TasksListModel) {
                  return TasksListItemDesign(tasksList: taskType);
                } else {
                  return GroupItemDesign(group: taskType);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
