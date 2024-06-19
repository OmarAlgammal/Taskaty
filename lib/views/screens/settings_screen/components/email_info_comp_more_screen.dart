import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/views/widgets/single_divider.dart';

import '../../../../repositories/local_service_repos/local_tasks_repo.dart';
import '../../../../repositories/remote_service_repos/auth_repo.dart';
import '../../../../service_locator/locator.dart';

class SettingsScreenEmailInfoCom extends StatelessWidget {
  const SettingsScreenEmailInfoCom(this.currentUser, {super.key});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(AppLocal.email.getString(context)),
          trailing: Text(
            locator<AuthRepo>().currentUser?.email ?? 'Error',
            style: context.textTheme.bodyMedium,
          ),
        ),
        const SingleDivider(),
        ListTile(
          title: Text(AppLocal.userName.getString(context)),
          trailing: Text(
            locator<AuthRepo>().currentUser?.displayName ?? 'Error',
            style: context.textTheme.bodyMedium,
          ),
        ),
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
              style: context.textTheme.bodyMedium!
                  .copyWith(color: context.colorScheme.error),
            )),
      ],
    );
  }
}
