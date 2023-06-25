import 'package:flutter/material.dart';

import '../../utils/constance/dimens.dart';
import '../../utils/constance/gaps.dart';

class EditableTaskItem extends StatelessWidget {
  EditableTaskItem(
      {Key? key,
      required this.title,
      required this.completedTask,
      required this.onTitleChanged,
      required this.onCheckChanged})
      : super(key: key);

  final String title;
  final bool completedTask;
  final Function(String? text) onTitleChanged;
  final Function(bool? value) onCheckChanged;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller..text = title,
              onChanged: onTitleChanged,
              style: const TextStyle(
                fontSize: size24,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          gap16,
          SizedBox(
            height: 24,
            width: 24,
            child: Transform.scale(
              scale: 1.3,
              child: Checkbox(
                value: completedTask,
                activeColor: Theme.of(context).colorScheme.onPrimary,
                shape: const CircleBorder(),
                onChanged: onCheckChanged,
              ),
            ),
          )
        ],
      ),
    );
  }
}
