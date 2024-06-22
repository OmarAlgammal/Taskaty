import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/models/navigation_models/payment_screen_model.dart';
import 'package:taskaty/routing/routes.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

import '../../../../localization/app_local.dart';

class PaymentButtonComp extends StatelessWidget {
  const PaymentButtonComp({super.key, required this.payForSubscription});

  final bool payForSubscription;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.firebasePaymentViewModel.getPaymentPrice(),
      builder: (context, snapshot) {
        return SizedBox(
          width: double.infinity,
          child: context.firebasePaymentViewModel.userOnSubscriptionPeriod &&
                  payForSubscription
              ? Center(
                  child: Text(
                    AppLocal.youAlreadySubscribed.getString(context),
                    style: context.textTheme.titleLarge!.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                )
              : FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.paymentScreen,
                        arguments: PaymentScreenModel(
                            payForSubscription: payForSubscription,
                            amount: payForSubscription
                                ? snapshot.data!.right.subscription
                                : snapshot.data!.right.sayThanks));
                  },
                  child: Text(payForSubscription
                      ? AppLocal.subscribe.getString(context)
                      : AppLocal.support.getString(context)),
                ),
        );
      },
    );
  }
}
