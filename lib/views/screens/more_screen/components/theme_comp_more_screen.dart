import 'package:flutter/material.dart';
import 'package:taskaty/theme/light_theme/light_theme.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/views/widgets/single_divider.dart';

class SettingsScreenThemeCom extends StatelessWidget {
  const SettingsScreenThemeCom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Appearance'),
        SingleDivider(),
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
  final ({
    String dark,
    String light,
  }) _themeValues = const (
    light: 'Light',
    dark: 'Dark',
  );

  late String? _groupValue;

  @override
  void initState() {
    _groupValue = context.themeViewModel.getTheme() == lightTheme
        ? _themeValues.light
        : _themeValues.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String>(
          value: _themeValues.light,
          groupValue: _groupValue,
          onChanged: (String? value) {
            context.themeViewModel.changeTheme();
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
            context.themeViewModel.changeTheme();
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
