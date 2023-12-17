import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/dimens.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 24,
          width: 24,
          child: Icon(icon),
        ),
      ),
    );
  }
}
