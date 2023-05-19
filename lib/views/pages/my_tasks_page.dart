import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../databases/local_databases/local_tasks_database.dart';
import '../../helpers/tasks_filtration.dart';
import '../../models/group_lists_model.dart';
import '../../models/task_model/task_model.dart';
import '../../models/tasks_list_model.dart';
import '../../service_locator/sl.dart';
import '../../util/constance/gaps.dart';
import '../../util/constance/icons.dart';
import '../widgets/group_item_design.dart';
import '../widgets/my_divider.dart';
import '../widgets/new_list_tile.dart';
import '../widgets/tasks_list_item_design.dart';

class MyTasksPage extends StatelessWidget {
  const MyTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            ValueListenableBuilder<Box<TaskModel>>(
              valueListenable: sl<LocalTasksDatabase>().getBox().listenable(),
              builder: (context, box, _) {
                final tasks = box.values.toList();
                debugPrint('here : ${tasks.length}');
                dynamic myTasks = sl<TasksFiltration>().getMyTasks(tasks);
                final tasksLists = sl<TasksFiltration>().getTasksLists(tasks);
                final groupsLists = sl<TasksFiltration>().getGroups(
                  tasks,
                );
                var groupsAndLists = [...tasksLists, ...groupsLists];

                return Expanded(
                  child: Column(
                    children: [
                      gap16,
                      TasksListItemDesign(
                        tasksList: myTasks,
                        icon: homeIcon,
                      ),
                      const MyDivider(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: groupsAndLists.length,
                          itemBuilder: (context, index) => index <
                                  tasksLists.length
                              ? TasksListItemDesign(
                                  tasksList:
                                      groupsAndLists[index] as TasksListModel,
                                )
                              : GroupItemDesign(
                                  group:
                                      groupsAndLists[index] as GroupListsModel),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const NewListTile()
          ],
        ));
  }
}
