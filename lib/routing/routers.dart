

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/views/screens/my_tasks_screen.dart';

import '../views/screens/completed_tasks_page.dart';
import '../views/screens/home_page.dart';
import '../views/screens/landing_page.dart';
import '../views/screens/my_day_page.dart';
import '../views/screens/note_page.dart';
import '../views/screens/payment_web_view_screen.dart';
import '../views/screens/sign_in_page.dart';
import '../views/screens/sign_up_page.dart';
import '../views/screens/sign_up_with_email_page.dart';
import '../views/screens/task_page.dart';
import '../views/screens/tasks_list_Screen.dart';
import 'routes.dart';

Map<String, Widget> screens = {
  AppRoutes.landingScreen: const LandingPage(),
  AppRoutes.signInScreen: const SignInScreen(),
  AppRoutes.signUpScreen: SignUpScreen(),
  AppRoutes.signUpWithEmailScreen: SignUpWithEmailScreen(),
  AppRoutes.homeScreen: HomeScreen(),
  AppRoutes.myTasksScreen: const MyTasksScreen(),
  AppRoutes.completedTasksScreen: const CompletedTasksPage(),
  AppRoutes.myDayScreen: const MyDayPage(),
  AppRoutes.noteScreen: NotePage(),
  AppRoutes.tasksListScreen: TasksListScreen(),
  AppRoutes.taskScreen: const TaskPage(),
  AppRoutes.paymentWebViewScreen: const PaymentWebViewScreen(),
};

Route onGenerate(RouteSettings settings) {
  return CupertinoPageRoute(
    settings: settings,
    builder: (context) => screens[settings.name] ?? HomeScreen(),
  );
}
