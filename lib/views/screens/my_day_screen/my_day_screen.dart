import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/my_padding.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/views/widgets/task/new_task_tile.dart';

class MyDayPage extends StatelessWidget {
  const MyDayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: MyPadding.padding8,
        child: Column(
          children: [
            Gaps.gap16,

            /// TODO: Change this widget name
            AddNewTask(addToMyDayState: true),
          ],
        ),
      ),
    );
  }
}
