
import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/enums/main_tabs_enum.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/views/widgets/single_divider.dart';
import 'package:taskaty/views/widgets/task_widget.dart';

import '../../../../models/task_model/task_model.dart';
import '../../../../utils/constance/icons.dart';

class TasksListComp extends StatelessWidget {
  const TasksListComp({super.key, required this.tab, required this.tasks});
  final MainTabs tab;
  final List<TaskModel> tasks;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding16,
      child: tasks.isEmpty ?  noTasksWidget:  SingleChildScrollView(
        child: Column(
          children: [
            gap16,
            doneTasksWidget(context),
            tasksListWidget(unCompletedTasks),
            if (completedTasks.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gap16,
                const SingleDivider(),
                gap8,
                Text('completed', style:  context.textTheme.titleMedium,),
                gap8,
                tasksListWidget(completedTasks),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget tasksListWidget(List<TaskModel> tasks) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (tasks.isNotEmpty)
      Text('count : ${tasks.length}'),
      gap4,
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => TaskWidget(task: tasks[index]),
        separatorBuilder: (context, index) => gap4,
        itemCount: tasks.length,
      ),
    ],
  );


  Widget get noTasksWidget => const Align(
    alignment: Alignment.center,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(AppIcons.listCheck, size:72),
        gap8,
        Text('No Tasks yet'),
      ],
    ),
  );
  
  Widget doneTasksWidget(BuildContext context) {
    return completedTasks.isNotEmpty && unCompletedTasks.isEmpty ? Padding(
      padding: paddingV18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(AppIcons.dove),
          gap8,
          Text('Good job, you have completed all the tasks', style: context.textTheme.bodyLarge,),
        ],
      ),
    ) : const SizedBox();
  }


  List<TaskModel> get completedTasks => tasks.where((element) => element.completed).toList();

  List<TaskModel> get unCompletedTasks => tasks.where((element) => ! element.completed).toList();
}
