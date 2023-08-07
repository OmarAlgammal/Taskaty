import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/databases/auth_database.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/string_extensions.dart';
import 'package:taskaty/views/widgets/my_divider.dart';

import '../../../../databases/local_databases/local_tasks_database.dart';
import '../../../../service_locator/locator.dart';

class SettingsScreenEmailInfoCom extends StatelessWidget {
  const SettingsScreenEmailInfoCom(this._baseAuthDatabase, {super.key});

  final BaseAuthDatabase _baseAuthDatabase;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .onPrimary,
          child: Text(
            locator<AuthDatabase>().currentUser.displayName ?? ''.firstChars(),
            style: TextStyle(color: Theme
                .of(context)
                .colorScheme
                .background),
          ),
        ),
        gap12,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _baseAuthDatabase.currentUser.displayName ?? '',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
            gap8,
            Text(_baseAuthDatabase.currentUser.email ?? ''),
            const MyDivider(),
            TextButton(
              onPressed: () {
                locator<AuthDatabase>().signOut();
                locator<LocalTasksDatabase>().clearData();
              },
              child: Text(
                'sign out'.tr(),
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .error,
                ),
              ),
            ),
            const MyDivider(),
          ],
        )
      ],
    );
  }
}
