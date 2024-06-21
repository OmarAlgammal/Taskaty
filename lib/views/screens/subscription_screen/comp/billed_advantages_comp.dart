import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

class BilledAdvantagesComp extends StatelessWidget {
  const BilledAdvantagesComp({super.key, required this.sayThanksSelected});

  final bool sayThanksSelected;

  @override
  Widget build(BuildContext context) {
    return sayThanksSelected ? ListTile(
      leading: Icon(AppIcons.heart, color: context.colorScheme.error,),
      title: Text(AppLocal.financialSupport.getString(context)),
    ) : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const Icon(AppIcons.checkIcon),
          title: Text(AppLocal.syncYourData.getString(context)),
        ),
        ListTile(
          leading: Icon(AppIcons.checkIcon),
          title: Text(AppLocal.accessYourData.getString(context)),
        ),
        ListTile(
          leading: Icon(AppIcons.checkIcon),
          title: Text(AppLocal.preserveYourData.getString(context)),
        ),
      ],
    );
  }
}
