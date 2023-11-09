import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/enums/main_tabs_enum.dart';
import 'package:taskaty/view_model/tasks_view_model/use_cases/sync_tasks_use_case.dart';
import 'package:taskaty/views/screens/home_screen/components/home_screen_tab_bar.dart';
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
      length: MainTabs.values.length,
      child: SafeArea(
        child: Scaffold(
          appBar: HomeScreenTabBar(),
          body: HomeScreenTabBarComp(),
        ),
      ),
    );
  }
}
