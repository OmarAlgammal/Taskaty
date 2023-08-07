import 'package:flutter/material.dart';

import '../../completed_tasks_screen/completed_tasks_screen.dart';
import '../../my_day_screen/my_day_screen.dart';
import '../../my_tasks_screen/my_tasks_screen.dart';

class HomeScreenTabBarComp extends StatelessWidget {
  const HomeScreenTabBarComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        MyDayPage(),
        MyTasksScreen(),
        CompletedTasksPage(),
      ],
    );
  }
}
