import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/models/list_model.dart';

import '../../../../databases/local_databases/local_tasks_database.dart';
import '../../../../helpers/tasks_utils.dart';
import '../../../../models/task_model/task_model.dart';
import '../../../../service_locator/locator.dart';
import '../../../../view_model/tasks_view_model/tasks_view_model.dart';
import '../../../widgets/task_item_design.dart';

class TasksListScreenTasksListComp extends StatelessWidget {
  const TasksListScreenTasksListComp({Key? key, required this.mainTask})
      : super(key: key);

  final TaskModel mainTask;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<TaskModel>>(
      valueListenable: locator<LocalTasksDatabase>().getBox().listenable(),
      builder: (context, box, _) {
        List<TaskModel> tasks = box.values.toList();
        final tasksUtils = TasksUtils(tasks: tasks);
        ListModel list = mainTask.listName != null
            ? tasksUtils
                .getCombinations()
                .lists
                .where((list) => list.mainTask.listName == mainTask.listName).single
            : tasksUtils.getCombinations().myTasks;
        return ListView.builder(
          itemCount: list.tasks.length,
          itemBuilder: (context, index) {
            TaskModel task = list.tasks[index];
            if (task.title == null) {
              return const SizedBox();
            }
            return StatefulBuilder(
              builder: (context, setState) {
                return TaskItemDesign(
                  task: task,
                  onCheckBoxClicked: (value) {
                    setState(() {
                      task.completed = value!;
                      locator<ViewModel>().updateTask(task);
                    });
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
