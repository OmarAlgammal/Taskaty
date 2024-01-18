import 'package:flutter/material.dart';

class AppBarCompTaskScreen extends StatelessWidget implements PreferredSizeWidget{
  const AppBarCompTaskScreen({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromWidth(36);
}
