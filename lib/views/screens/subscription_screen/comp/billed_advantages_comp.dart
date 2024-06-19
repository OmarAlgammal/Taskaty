import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

class BilledAdvantagesComp extends StatelessWidget {
  const BilledAdvantagesComp({super.key, required this.sayThanksSelected});

  final bool sayThanksSelected;

  @override
  Widget build(BuildContext context) {
    return sayThanksSelected ? ListTile(
      leading: Icon(AppIcons.heart, color: context.colorScheme.error,),
      title: const Text('Financial support'),
    ) : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(AppIcons.checkIcon),
          title: Text('Sync your data via the cloud'),
        ),
        ListTile(
          leading: Icon(AppIcons.checkIcon),
          title: Text('Access your data via any device'),
        ),
        ListTile(
          leading: Icon(AppIcons.checkIcon),
          title: Text('Preserve your data from loss'),
        ),
      ],
    );
  }
}
