import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/routing/routes.dart';

import '../views/pages/completed_tasks_page.dart';
import '../views/pages/home_page.dart';
import '../views/pages/landing_page.dart';
import '../views/pages/my_day_page.dart';
import '../views/pages/my_tasks_page.dart';
import '../views/pages/note_page.dart';
import '../views/pages/sign_in_page.dart';
import '../views/pages/sign_up_page.dart';
import '../views/pages/sign_up_with_email_page.dart';
import '../views/pages/task_page.dart';
import '../views/pages/tasks_list_page.dart';

Map<String, Widget> screens = {
  AppRoutes.landingPage: const LandingPage(),
  AppRoutes.signInPage: SignInPage(),
  AppRoutes.signUpPage: SignUpPage(),
  AppRoutes.signUpWithEmailPage: SignUpWithEmailPage(),
  AppRoutes.homePage: HomePage(),
  AppRoutes.myTasksPage: const MyTasksPage(),
  AppRoutes.completedTasksPage: const CompletedTasksPage(),
  AppRoutes.myDayPage: MyDayPage(),
  AppRoutes.notePage: NotePage(),
  AppRoutes.tasksListPage: TasksListPage(),
  AppRoutes.taskPage: const TaskPage(),
};

Route onGenerate(RouteSettings settings) {
  return CupertinoPageRoute(
    settings: settings,
    builder: (context) => screens[settings.name] ?? HomePage(),
  );
}
