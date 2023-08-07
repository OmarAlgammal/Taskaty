import 'package:flutter/material.dart';
import 'package:taskaty/views/screens/my_tasks_screen/components/my_tasks_screen_tasks_lists_comp.dart';
import 'package:taskaty/views/widgets/new_list_tile.dart';

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: const Column(
          children: [
            MyTasksScreenTasksListsComp(),
            /// TODO: change this name to name related with lists and group
            NewListTile()
          ],
        ));
  }
}
