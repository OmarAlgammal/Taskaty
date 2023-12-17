import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/string_extensions.dart';
import 'package:taskaty/views/widgets/singl_divider.dart';

import '../../../../repositories/local_service_repos/local_tasks_repo.dart';
import '../../../../repositories/remote_service_repos/auth_repo.dart';
import '../../../../service_locator/locator.dart';

class SettingsScreenEmailInfoCom extends StatelessWidget {
  const SettingsScreenEmailInfoCom(this.currentUser, {super.key});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          child: Text(
            locator<AuthRepo>().currentUser!.displayName ?? ''.firstChars(),
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
        ),
        gap12,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentUser.displayName ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            gap8,
            Text(currentUser.email ?? ''),
            const SingleDivider(),
            TextButton(
              onPressed: () {
                locator<AuthRepo>().signOut();
                locator<LocalTasksRepo>().clearData();
              },
              child: Text(
                'sign out'.tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ),
            const SingleDivider(),
          ],
        )
      ],
    );
  }
}
