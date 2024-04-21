import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/views/screens/home_screen/components/home_screen_tab_bar.dart';
import 'package:taskaty/views/screens/home_screen/components/home_screen_tab_bar_comp.dart';

import '../../../utils/constance/icons.dart';
import 'components/add_task_button_comp_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: context.mainTabs.length,
      child: SafeArea(
        child: Scaffold(
          appBar: HomeScreenTabBar(),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              AppIcons.addIcon,
              color: context.colorScheme.background,
            ),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const AddTaskButtonCompHomeScreen(),
              );
            },
          ),
          body: StreamBuilder(
              stream: context.taskViewModel.getTasksSource(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text(AppLocal.error.getString(context)));
                }
                if (snapshot.connectionState == ConnectionState.none &&
                    snapshot.data == null) {
                  return Center(child: Text(AppLocal.error.getString(context)));
                }

                return HomeScreenTabViewComp(filteredTasks: snapshot.data!);
              }),
        ),
      ),
    );
  }
}
