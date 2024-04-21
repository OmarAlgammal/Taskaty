
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/utils/constance/my_padding.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/enums/main_tabs_enum.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/helper/tasks_filtration_helper.dart';
import 'package:taskaty/views/widgets/single_divider.dart';
import 'package:taskaty/views/widgets/task/task_widget.dart';

import '../../../../models/task_model/task_model.dart';
import '../../../../utils/constance/icons.dart';

class TasksListComp extends StatelessWidget {
  TasksListComp({super.key, required this.tasks});
  final List<TaskModel> tasks;
  late final completedTasks;
  late final unCompletedTasks;
  @override
  Widget build(BuildContext context) {
    completedTasks = TasksFiltrationHelper.completedTasks(tasks);
    unCompletedTasks = TasksFiltrationHelper.unCompletedTasks(tasks);
    return Padding(
      padding: MyPadding.padding16,
      child: tasks.isEmpty ?  noTasksWidget:  SingleChildScrollView(
        child: Column(
          children: [
            Gaps.gap16,
            doneTasksWidget(context),
            tasksListWidget(context, unCompletedTasks),
            if (completedTasks.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.gap16,
               const SingleDivider(),
                Gaps.gap8,
                Text(AppLocal.completed.getString(context), style:  context.textTheme.titleMedium,),
                Gaps.gap8,
                tasksListWidget(context, completedTasks),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// TODO: Transfer this method
  Widget tasksListWidget(BuildContext context, List<TaskModel> tasks) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (tasks.isNotEmpty)
      Text('${AppLocal.count.getString(context)} : ${tasks.length}'),
      Gaps.gap4,
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => TaskWidget(task: tasks[index]),
        separatorBuilder: (context, index) => Gaps.gap4,
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
        Gaps.gap8,
        Text('No Tasks yet'),
      ],
    ),
  );
  Widget doneTasksWidget(BuildContext context) {
    return completedTasks.isNotEmpty && unCompletedTasks.isEmpty ? Padding(
      padding: MyPadding.paddingV18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(AppIcons.dove),
          Gaps.gap8,
          Text('Good job, you have completed all the tasks', style: context.textTheme.bodyLarge,),
        ],
      ),
    ) : const SizedBox();
  }

}
