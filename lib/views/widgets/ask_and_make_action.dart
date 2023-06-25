import 'package:flutter/material.dart';

import '../../utils/constance/gaps.dart';

class AskAndMakeAction extends StatelessWidget {
  const AskAndMakeAction({
    Key? key,
    required this.question,
    required this.action,
    required this.onPressed,
  }) : super(key: key);

  final String question;
  final String action;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
        ),
        gap8,
        TextButton(
          onPressed: onPressed,
          child: Text(
            action,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
