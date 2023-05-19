import 'package:flutter/material.dart';

import '../../util/constance/dimens.dart';

class TaskOptionItemDesign extends StatelessWidget {
  const TaskOptionItemDesign(
      {Key? key,
      required this.icon,
      required this.optionName,
      this.optionState = false,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final bool optionState;
  final String optionName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final color = optionState ? Theme.of(context).colorScheme.onPrimary : null;
    return ListTile(
      horizontalTitleGap: size0,
      contentPadding: paddingH8,
      onTap: onPressed,
      leading: Icon(
        icon,
        size: 24,
        color: color,
      ),
      title: Text(
        optionName,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
