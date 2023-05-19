import 'package:flutter/material.dart';

import '../../util/constance/dimens.dart';

class RegisterItemDesign extends StatelessWidget {
  const RegisterItemDesign(
      {Key? key,
      required this.icon,
      required this.registrationText,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String registrationText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: circular8,
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: size2,
          )),
      leading: Icon(
        icon,
        size: size36,
      ),
      title: Text(
        registrationText,
        style: const TextStyle(
          fontSize: size18,
        ),
      ),
    );
  }
}
