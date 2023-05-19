
import 'package:flutter/material.dart';

import '../../util/constance/dimens.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.onPressed, required this.buttonName}) : super(key: key);

  final VoidCallback onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
      return TextButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(
            /// TODO: Refactor this
            const Size(double.maxFinite, size56),
          ),
            backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.primary,
            ),

        ),
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: TextStyle(
              color: Theme.of(context).primaryColor
          ),
        ),
      );
  }
}
