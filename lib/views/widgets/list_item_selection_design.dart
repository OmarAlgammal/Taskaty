import 'package:flutter/material.dart';

import '../../utils/constance/dimens.dart';
import '../../utils/constance/icons.dart';

class ListItemSelectionDesign extends StatelessWidget {
  const ListItemSelectionDesign(
      {Key? key, required this.taskListName, required this.onPressed, this.addListIconState,})
      : super(key: key);

  final String taskListName;
  final VoidCallback onPressed;
  final IconData? addListIconState;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        horizontalTitleGap: size0,
        leading: const Icon(
          AppIcons.listIcon,
        ),
        title: Text(
          taskListName,
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(
            addListIconState ?? AppIcons.addNewTaskIcon,
          ),
        ));
  }
}
