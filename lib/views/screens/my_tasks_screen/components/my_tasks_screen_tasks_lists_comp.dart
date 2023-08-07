import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../databases/local_databases/local_tasks_database.dart';
import '../../../../helpers/tasks_utils.dart';
import '../../../../models/group_model.dart';
import '../../../../models/task_model/task_model.dart';
import '../../../../models/list_model.dart';
import '../../../../service_locator/locator.dart';
import '../../../../utils/constance/gaps.dart';
import '../../../../utils/constance/icons.dart';
import '../../../widgets/group_component.dart';
import '../../../widgets/my_divider.dart';
import '../../../widgets/tasks_list_item_design.dart';

class MyTasksScreenTasksListsComp extends StatelessWidget {
  const MyTasksScreenTasksListsComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<TaskModel>>(
      valueListenable: locator<LocalTasksDatabase>().getBox().listenable(),
      builder: (context, box, _) {
        final tasks = box.values.toList();
        final tasksUtils = TasksUtils(tasks: tasks);
        final combinations = tasksUtils.getCombinations();
        final myTasks = combinations.myTasks;
        final lists = combinations.lists.where((list) => list.mainTask.isIndependentList());
        final groups = combinations.groups;
        var groupsAndLists = [...lists, ...groups];
        return Expanded(
          child: Column(
            children: [
              gap16,
              TasksListItemDesign(
                list: myTasks,
                icon: homeIcon,
              ),
              const MyDivider(),
              Expanded(
                child: ListView.builder(
                    itemCount: groupsAndLists.length,
                    itemBuilder: (context, index) {
                      final collection = index < lists.length
                          ? groupsAndLists[index]
                          : groupsAndLists[index];
                      return index < lists.length
                          ? (collection as ListModel)
                                  .mainTask
                                  .isIndependentList()
                              ? TasksListItemDesign(
                                  list: groupsAndLists[index] as ListModel,
                                )
                              : const SizedBox()
                          : GroupComponent(
                              group: collection as GroupModel,
                              lists: [...collection.lists, ...lists],
                            );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
