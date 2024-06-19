import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/theme/light_theme/light_theme.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

class AppearanceComp extends StatefulWidget {
  const AppearanceComp({super.key});

  @override
  State<AppearanceComp> createState() => _AppearanceCompState();
}

class _AppearanceCompState extends State<AppearanceComp> {
  late bool _themeResult;

  bool getThemeResult() {
    _themeResult = context.themeViewModel.getTheme() == lightTheme;
    return _themeResult;
  }

  @override
  Widget build(BuildContext context) {
    getThemeResult();
    return SwitchListTile(
      value: _themeResult,
      onChanged: (bool value) {
        context.themeViewModel.changeTheme();
        setState(() {
          _themeResult = value;
        });
      },
      title: Text(AppLocal.light.getString(context)),
    );
  }
}
