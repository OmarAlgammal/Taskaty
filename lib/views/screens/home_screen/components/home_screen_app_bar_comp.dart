import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/utils/extensions/screen_dimens.dart';

import '../../../../databases/auth_database.dart';
import '../../../../databases/local_databases/local_tasks_database.dart';
import '../../../../service_locator/locator.dart';
import '../../../../utils/constance/dimens.dart';
import '../../../../utils/constance/paths.dart';

class HomeScreenAppBarcom extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeScreenAppBarcom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          icon: const Icon(Icons.settings),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
