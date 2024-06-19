import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/models/navigation_models/payment_screen_model.dart';
import 'package:taskaty/routing/routes.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';

import '../../../../utils/constance/icons.dart';
import '../../../../utils/constance/my_padding.dart';

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
          stream:
          context.firebasePaymentViewModel.getLastPaymentProcess(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data != null) {
                return Text(
                  'You have subscribed until ${snapshot.data!.expiryDate.myDateFormat}',
                  style: context.textTheme.titleLarge,
                );
              }
            }
            return const SizedBox();
          },
        ),
        ListTile(
          onTap: (){
            Navigator.pushNamed(context, AppRoutes.subscription);
          },
          title: Text(AppLocal.subscriptionPlan, style: context.textTheme.bodyLarge,),
          trailing: const Icon(AppIcons.arrowForward),
        )
      ],
    );
    return ListTile(
      onTap: () {
        if (amount != null) {
          Navigator.pushNamed(context, AppRoutes.paymentScreen,
              arguments: PaymentScreenModel(
                  payForSubscription: payForSubscription, amount: amount!));
        }
      },
      contentPadding: MyPadding.padding0,
      leading: payForSubscription
          ? null
          : Icon(
              AppIcons.heart,
              color: context.colorScheme.primary,
            ),
      title: Text(payForSubscription
          ? AppLocal.subscribe.getString(context)
          : AppLocal.sayThanks.getString(context)),
      trailing: FutureBuilder(
        future: context.firebasePaymentViewModel.getPaymentPrice(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text(AppLocal.loading.getString(context));
          }
          if (snapshot.data != null && snapshot.data!.isRight) {
            return Text('${snapshot.data!.right} EGP');
          }
          return Text(AppLocal.error.getString(context));
        },
      ),
    );
  }
}
