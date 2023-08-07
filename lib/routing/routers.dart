

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/views/screens/list_screen/list_screen.dart';
import 'package:taskaty/views/screens/my_tasks_screen/my_tasks_screen.dart';
import 'package:taskaty/views/screens/settings_screen/settings_screen.dart';

import '../views/screens/completed_tasks_screen/completed_tasks_screen.dart';
import '../views/screens/home_screen/home_screen.dart';
import '../views/screens/landing_screen/landing_screen.dart';
import '../views/screens/my_day_screen/my_day_screen.dart';
import '../views/screens/note_screen/note_screen.dart';
import '../views/screens/sign_in_screen/sign_in_screen.dart';
import '../views/screens/sign_in_with_account_screen/sign_up_screen.dart';
import '../views/screens/task_screen/task_screen.dart';
import 'routes.dart';

Map<String, Widget> screens = {
  AppRoutes.landingScreen: const LandingPage(),
  AppRoutes.signInScreen: const SignInScreen(),
  AppRoutes.signUpScreen: SignUpScreen(),
  //AppRoutes.signUpWithEmailScreen: SignUpWithEmailScreen(),
  AppRoutes.homeScreen: HomeScreen(),
  AppRoutes.myTasksScreen: const MyTasksScreen(),
  AppRoutes.completedTasksScreen: const CompletedTasksPage(),
  AppRoutes.myDayScreen: const MyDayPage(),
  AppRoutes.noteScreen: NotePage(),
  AppRoutes.tasksListScreen: ListScreen(),
  AppRoutes.taskScreen: const TaskPage(),
  AppRoutes.settingScreen: const SettingsScreen(),
  //AppRoutes.paymentWebViewScreen: const PaymentWebViewScreen(),
};

Route onGenerate(RouteSettings settings) {
  return CupertinoPageRoute(
    settings: settings,
    builder: (context) => screens[settings.name] ?? HomeScreen(),
  );
}
