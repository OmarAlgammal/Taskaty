import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/border_radius.dart';

import '../../../../utils/constance/dimens.dart';

class RegiserComp extends StatelessWidget {
  const RegiserComp(
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
          borderRadius: Circular.circular8,
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: size2,
          )),
      leading: Icon(
        icon,
        size: size28,
      ),
      title:
          Text(registrationText, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
