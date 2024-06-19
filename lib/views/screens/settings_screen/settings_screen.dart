import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/routing/routes.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/constance/my_padding.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/views/screens/settings_screen/components/susbscription_plan_comp.dart';
import 'package:taskaty/views/widgets/single_divider.dart';

import '../../../repositories/remote_service_repos/auth_repo.dart';
import 'components/email_info_comp_more_screen.dart';
import 'components/appearance_comp.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocal.settings.getString(context),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubscriptionPlanComp(),
            Gaps.gap16,
            Container(
              color: context.colorScheme.primary.withOpacity(.5),
              height: 24,
            ),
            Gaps.gap16,
            const AppearanceComp(),
            Gaps.gap16,
            Container(
              color: context.colorScheme.primary.withOpacity(.5),
              height: 24,
            ),
            Gaps.gap16,
            SettingsScreenEmailInfoCom(locator<AuthRepo>().currentUser!),
          ],
        ),
      ),
    );
  }
}
