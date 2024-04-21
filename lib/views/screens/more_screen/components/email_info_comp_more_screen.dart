import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/string_extensions.dart';
import 'package:taskaty/views/widgets/single_divider.dart';

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
          backgroundColor: context.colorScheme.primary,
          child: Text(
            locator<AuthRepo>().currentUser!.displayName ?? ''.firstChars(),
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
        ),
        Gaps.gap12,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentUser.displayName ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Gaps.gap8,
            Text(currentUser.email ?? ''),
            const SingleDivider(),
            TextButton(
              onPressed: () {
                locator<AuthRepo>().signOut().then((value) {
                  locator<LocalTasksRepo>().clearData();
                  Navigator.pop(context);
                });
              },
              child: Text(
                AppLocal.signOut.getString(context),
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
