import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/databases/auth_database.dart';
import 'package:taskaty/databases/firestore_database.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/extensions/screen_dimens.dart';
import 'package:taskaty/view_model/tasks_view_model/use_cases/sync_tasks_use_case.dart';

import '../../services/internet_connection.dart';
import '../../utils/constance/dimens.dart';
import '../../utils/constance/paths.dart';
import 'completed_tasks_page.dart';
import 'my_day_page.dart';
import 'my_tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

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
          appBar: AppBar(
            toolbarHeight: size86,
            centerTitle: true,
            title: true
                ? const Text('Taskaty')
                : SizedBox(
                    height: size46,
                    child: SvgPicture.asset(logoPath),
                  ),
            actions: [
              IconButton(
                onPressed: () {
                  locator<AuthDatabase>().signOut();
                  locator<LocalTasksDatabase>().clearData();
                },
                icon: Icon(Icons.settings),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size(((context.width / 7) * 3), size56),
              child: SizedBox(
                width: ((context.width / 7) * 3),
                child: TabBar(
                  tabs: [
                    SizedBox(
                      height: size36,
                      child: Center(
                        child: Text(
                          'myDay'.tr(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size36,
                      child: Center(
                        child: Text(
                          'myTasks'.tr(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size36,
                      child: Center(
                        child: Text(
                          'completed'.tr(),
                        ),
                      ),
                    ),
                  ],
                  physics: const NeverScrollableScrollPhysics(),
                  indicator: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: circular100,
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              MyDayPage(),
              const MyTasksScreen(),
              const CompletedTasksPage(),
            ],
          )),
    );
  }
}
