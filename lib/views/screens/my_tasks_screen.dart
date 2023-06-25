import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/helpers/tasks_utils.dart';
import 'package:taskaty/models/group_lists_model.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/models/tasks_list_model.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/views/widgets/group_component.dart';
import 'package:taskaty/views/widgets/my_divider.dart';
import 'package:taskaty/views/widgets/new_list_tile.dart';
import 'package:taskaty/views/widgets/tasks_list_item_design.dart';

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            ValueListenableBuilder<Box<TaskModel>>(
              valueListenable: locator<LocalTasksDatabase>().getBox().listenable(),
              builder: (context, box, _) {
                final tasks = box.values.toList();
                final tasksUtils = TasksUtils(tasks: tasks);
                final myTasks = tasksUtils.getMyTasks();
                final tasksLists = tasksUtils.getTasksLists();
                final groupsLists = tasksUtils.getGroups();
                var groupsAndLists = [...tasksLists, ...groupsLists];
                debugPrint('my tasks screen : tasks length is ${tasks.length}');
                return Expanded(
                  child: Column(
                    children: [
                      gap16,
                      TasksListItemDesign(
                        tasksListModel: myTasks,
                        icon: homeIcon,
                      ),
                      const MyDivider(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: groupsAndLists.length,
                          itemBuilder: (context, index) => index <
                                  tasksLists.length
                              ? TasksListItemDesign(
                                  tasksListModel:
                                      groupsAndLists[index] as TasksListModel,
                                )
                              : GroupComponent(
                                  group:
                                      groupsAndLists[index] as GroupListsModel,
                                  tasksLists: [
                                    ...(groupsAndLists[index]
                                            as GroupListsModel)
                                        .lists,
                                    ...tasksLists
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            /// TODO: change this name to name related with lists and group
            const NewListTile()
          ],
        ));
  }
}
