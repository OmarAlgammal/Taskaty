import 'package:flutter/material.dart';
import 'package:taskaty/utils/enums/main_tabs_enum.dart';

class HomeScreenTabBarComp extends StatelessWidget {
  const HomeScreenTabBarComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: List.generate(MainTabs.values.length, (index) => Scaffold()),
    );
  }
}
