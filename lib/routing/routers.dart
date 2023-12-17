import 'package:flutter/cupertino.dart';
import 'package:taskaty/views/screens/payment_screen/payment_screen.dart';
import 'package:taskaty/views/screens/register_screen/register_screen.dart';

import '../views/screens/home_screen/home_screen.dart';
import '../views/screens/landing_screen/landing_screen.dart';
import '../views/screens/more_screen/more_screen.dart';
import '../views/screens/my_day_screen/my_day_screen.dart';
import '../views/screens/note_screen/note_screen.dart';
import '../views/screens/task_screen/task_screen.dart';
import 'routes.dart';

Map<String, Widget> screens = {
  AppRoutes.landingScreen: const LandingPage(),
  AppRoutes.registerScreen: const RegisterScreen(),
  AppRoutes.paymentScreen: const PaymentScreen(),
  AppRoutes.homeScreen: const HomeScreen(),
  AppRoutes.myDayScreen: const MyDayPage(),
  AppRoutes.noteScreen: NotePage(),
  AppRoutes.taskScreen: const TaskPage(),
  AppRoutes.moreScreen: const MoreScreen(),
};

Route onGenerate(RouteSettings settings) {
  return CupertinoPageRoute(
    settings: settings,
    builder: (context) => screens[settings.name] ?? const HomeScreen(),
  );
}
