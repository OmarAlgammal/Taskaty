import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/theme/light_theme/light_theme.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

import '../../../../repositories/remote_service_repos/auth_repo.dart';
import '../../../../service_locator/locator.dart';
import '../../../widgets/single_divider.dart';

class AppearanceComp extends StatefulWidget {
  const AppearanceComp({super.key});

  @override
  State<AppearanceComp> createState() => _AppearanceCompState();
}

class _AppearanceCompState extends State<AppearanceComp> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          value: context.themeViewModel.isLightTheme(),
          onChanged: (bool value) {
            context.themeViewModel.changeTheme();
            setState(() {});
          },
          title: Text(AppLocal.light.getString(context)),
        ),
        const SingleDivider(),
        SwitchListTile(
          value: context.languageViewModel.languageIsEnglish(),
          onChanged: (bool value) {
            context.languageViewModel.setLanguageValue(value);
            FlutterLocalization.instance.translate(context.languageViewModel.getInitialLanguageCode());
            setState(() {});
          },
          title: Text(AppLocal.english.getString(context)),
        ),
      ],
    );
  }
}
