import 'package:flutter/material.dart';
import 'package:taskaty/databases/auth_database.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/gaps.dart';

import 'components/settings_screen_email_info_com.dart';
import 'components/setttings_screen_theme_comp.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: padding16,
        child: Column(
          children: [
            SettingsScreenEmailInfoCom(locator<AuthDatabase>()),
            const SettingsScreenThemeCom(),
          ],
        ),
      ),
    );
  }
}
