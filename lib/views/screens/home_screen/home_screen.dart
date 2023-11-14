import 'package:flutter/material.dart';
import 'package:taskaty/utils/enums/main_tabs_enum.dart';
import 'package:taskaty/views/screens/home_screen/components/home_screen_tab_bar.dart';
import 'package:taskaty/views/screens/home_screen/components/home_screen_tab_bar_comp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: MainTabs.values.length,
      child: SafeArea(
        child: Scaffold(
          appBar: HomeScreenTabBar(),
          body: HomeScreenTabViewComp(),
        ),
      ),
    );
  }
}
