import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:marquee/marquee.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/routing/routes.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';

import '../../../../utils/constance/icons.dart';

class SubscriptionPlanComp extends StatelessWidget {
  SubscriptionPlanComp({super.key, this.payForSubscription = true});

  final bool payForSubscription;
  int? amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: context.firebasePaymentViewModel.getLastPaymentProcess(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data != null) {
                return SizedBox(
                  height: 36,
                  child: Marquee(
                    text: '${AppLocal.youHaveSubscribedUntil.getString(context)} ${snapshot.data!.expiryDate.myDateFormat} \t \t',
                    scrollAxis: Axis.horizontal,
                    style: context.textTheme.titleLarge,
                  ),
                );
              }
            }
            return const SizedBox();
          },
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.subscription);
          },
          title: Text(
            AppLocal.subscriptionPlan.getString(context),
            style: context.textTheme.bodyLarge,
          ),
          trailing: const Icon(AppIcons.arrowForward),
        )
      ],
    );
  }
}
