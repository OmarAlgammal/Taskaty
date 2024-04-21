import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';

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
            title: Text(AppLocal.addNote.getString(context)),
            leading: const Icon(AppIcons.addIcon),
            horizontalTitleGap: 0,
            onTap: onNoteBackButtonPressed),
        Text(task.note ?? ''),
      ],
    );
  }
}
