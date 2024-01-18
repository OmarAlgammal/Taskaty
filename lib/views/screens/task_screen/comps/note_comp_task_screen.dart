import 'package:flutter/material.dart';

import '../../../../models/task_model/task_model.dart';
import '../../../../utils/constance/icons.dart';

class NoteCompTaskScreen extends StatelessWidget {
  const NoteCompTaskScreen(
      {super.key, required this.task, required this.onNoteBackButtonPressed});

  final TaskModel task;
  final VoidCallback onNoteBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            title: const Text('Add a note'),
            leading: const Icon(AppIcons.addIcon),
            horizontalTitleGap: 0,
            onTap: onNoteBackButtonPressed),
        Text(task.note ?? ''),
      ],
    );
  }
}
