import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/helpers/tasks_utils.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/view_model/tasks_view_model/tasks_view_model.dart';
import 'package:taskaty/views/widgets/task_item_design.dart';

import '../../../models/list_model.dart';
import '../../../service_locator/locator.dart';
import '../../../utils/constance/gaps.dart';
import '../../widgets/new_task_tile.dart';
import 'components/list_screen_app_bar_comp.dart';
import 'components/list_screen_tasks_list_comp.dart';

class ListScreen extends StatelessWidget {
  ListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksList =
        ModalRoute.of(context)!.settings.arguments as ListModel;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: ListScreenAppBarComp(list: tasksList),
      body: Column(
        children: [
          gap16,
          Flexible(
            child: TasksListScreenTasksListComp(mainTask: tasksList.mainTask),
          ),
          Flexible(
            flex: 0,
            child: AddNewTask(listName: tasksList.mainTask.listName),
          ),
        ],
      ),
    );
  }
}
