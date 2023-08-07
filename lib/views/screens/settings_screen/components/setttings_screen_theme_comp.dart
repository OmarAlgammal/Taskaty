import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/view_model/theme_view_model/theme_view_model.dart';

class SettingsScreenThemeCom extends StatelessWidget {
  const SettingsScreenThemeCom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Apperace'),
        MyRadioListTile(),
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
  final ({String dark, String light,}) _themeValues = const (
    light: 'Light',
    dark: 'Dark',
  );

  late String? _groupValue;

  @override
  void initState() {
    _groupValue = _themeValues.light;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String>(
          value: _themeValues.light,
          groupValue: _groupValue,
          onChanged: (String? value) {
            ThemeViewModel.instance(context).changeTheme();
            setState(() {
              _groupValue = value;
            });
          },
          title: Text(_themeValues.light),
        ),
        RadioListTile<String>(
          value: _themeValues.dark,
          groupValue: _groupValue,
          onChanged: (String? value) {
            ThemeViewModel.instance(context).changeTheme();
            setState(() {
              _groupValue = value;
            });
          },
          title: Text(_themeValues.dark),
        ),
      ],
    );
  }
}
