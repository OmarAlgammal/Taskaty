import 'package:flutter/material.dart';
import 'package:taskaty/models/task_model/task_model.dart';

import '../../../../utils/constance/my_padding.dart';
import '../../../../utils/constance/gaps.dart';

class TitleAndCheckboxCompTaskScreen extends StatelessWidget {
  const TitleAndCheckboxCompTaskScreen({super.key, required this.task, required this.titleController, required this.onCheckBoxChanged});

  final TextEditingController titleController;
  final TaskModel task;
  final void Function(bool?) onCheckBoxChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            maxLines: 2,
            controller: titleController..text = task.title,
            onChanged: (value) {
              task.updateTask(title: titleController.text);
            },
            style: const TextStyle(
              fontSize: 24,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        Gaps.gap16,
        SizedBox(
          height: 24,
          width: 24,
          child: Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: task.completed,
              activeColor: Theme.of(context).colorScheme.primary,
              shape: const CircleBorder(),
              onChanged: onCheckBoxChanged,
            ),
          ),
        ),
      ],
    );
  }
}
