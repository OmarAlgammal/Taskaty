import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/views/screens/my_day_screen/components/my_day_screen_tasks_list_comp.dart';
import 'package:taskaty/views/widgets/new_task_tile.dart';

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
            const MyDayScreenTasksListComp(),

            /// TODO: Change this widget name
            AddNewTask(addToMyDayState: true),
          ],
        ),
      ),
    );
  }
}