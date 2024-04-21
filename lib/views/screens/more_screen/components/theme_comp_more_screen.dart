import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/theme/light_theme/light_theme.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/views/widgets/single_divider.dart';

class SettingsScreenThemeCom extends StatelessWidget {
  const SettingsScreenThemeCom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocal.appearance.getString(context)),
        const SingleDivider(),
        const MyRadioListTile(),
      ],
    );
  }
}

class MyRadioListTile extends StatefulWidget {
  const MyRadioListTile({super.key});

  @override
  State<MyRadioListTile> createState() => _MyRadioListTileState();
}

class _MyRadioListTileState extends State<MyRadioListTile> {

  late ({
  String dark,
  String light,
  }) _themeValues;
  late String? _themeResult;

  ({
  String dark,
  String light,
  }) getThemeValues(){
    _themeValues = (
    light: AppLocal.light.getString(context),
    dark: AppLocal.dark.getString(context),
    );
    return _themeValues;
  }

  String? getThemeResult(){
    _themeResult = context.themeViewModel.getTheme() == lightTheme
        ? _themeValues.light
        : _themeValues.dark;
    return _themeResult;
  }
  @override
  Widget build(BuildContext context) {
   getThemeValues();
   getThemeResult();
    return Column(
      children: [
        RadioListTile<String>(
          value: _themeValues.light,
          groupValue: _themeResult,
          onChanged: (String? value) {
            context.themeViewModel.changeTheme();
            setState(() {
              _themeResult = value;
            });
          },
          title: Text(_themeValues.light),
        ),
        RadioListTile<String>(
          value: _themeValues.dark,
          groupValue: _themeResult,
          onChanged: (String? value) {
            context.themeViewModel.changeTheme();
            setState(() {
              _themeResult = value;
            });
          },
          title: Text(_themeValues.dark),
        ),
      ],
    );
  }
}
