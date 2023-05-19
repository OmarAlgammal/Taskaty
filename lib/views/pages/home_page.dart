import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/util/extensions/screen_dimens.dart';

import '../../util/constance/dimens.dart';
import '../../util/constance/paths.dart';
import 'completed_tasks_page.dart';
import 'my_day_page.dart';
import 'my_tasks_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


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
              const MyTasksPage(),
              const CompletedTasksPage(),
            ],
          )),
    );
  }
}
