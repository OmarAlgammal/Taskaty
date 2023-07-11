import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/view_model/tasks_view_model/use_cases/sync_tasks_use_case.dart';
import 'package:taskaty/views/screens/home_screen/components/home_screen_app_bar_comp.dart';
import 'package:taskaty/views/screens/home_screen/components/home_screen_tab_bar_comp.dart';

import '../../../services/internet_connection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    locator<InternetConnection>()
        .checkInternetConnection()
        .listen((connectivityResult) {
      if (connectivityResult != ConnectivityResult.none) {
        locator<SyncTaskUseCase>().syncTasks();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const HomeScreenAppBarComp(),
        body: const HomeScreenTabBarComp(),
      ),
    );
  }
}
