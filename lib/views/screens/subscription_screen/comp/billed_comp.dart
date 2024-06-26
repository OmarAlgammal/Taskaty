import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/utils/constance/border_radius.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/constance/my_padding.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/view_model/selected_subscription_view_model/payment_type_view_model.dart';

import '../../../../theme/colors.dart';

class BilledComp extends StatelessWidget {
  const BilledComp({super.key, required this.payForSubscription});

  final bool payForSubscription;

    @override
    Widget build(BuildContext context) {
      return FutureBuilder(
        future: context.firebasePaymentViewModel.getPaymentPrice(),
        builder: (context, snapshot) {
          ({String sayThanksValue, String subscriptionValue}) value;
          if (snapshot.connectionState == ConnectionState.waiting) {
            value =
            (sayThanksValue: 'Waiting', subscriptionValue: 'Subscription');
          }
          if (snapshot.data != null && snapshot.data!.isRight) {
            value = (
            sayThanksValue: '${snapshot.data!.right.sayThanks} LE',
            subscriptionValue: '${snapshot.data!.right.subscription} LE'
            );
          } else {
            value = (sayThanksValue: 'Error', subscriptionValue: 'Error');
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              billedItem(context,
                  title: AppLocal.sayThanks.getString(context),
                  value: value.sayThanksValue,
                  description: AppLocal.supportAsYouWish.getString(context),
                  borderColor: payForSubscription
                      ? AppColors.transparentColor
                      : context.colorScheme.primary,),
              Gaps.gap16,
              billedItem(context,
                  title: AppLocal.annual.getString(context),
                  value: value.subscriptionValue,
                  description: AppLocal.billedAnnual.getString(context),
                  borderColor: payForSubscription
                      ? context.colorScheme.primary
                      : AppColors.transparentColor,
                  ),
            ],
          );
        },
      );
    }

    Widget billedItem(BuildContext context,
        {required String title,
          required String value,
          required String description,
          Color? borderColor,
          }) =>
        Expanded(
          child: InkWell(
            onTap: (){
              PaymentTypeViewModel.instance(context).changePaymentType();
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: Circular.circular12,
                border: Border.all(
                    color: borderColor ?? AppColors.transparentColor, width: 3),
                color: context.colorScheme.surface,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.titleLarge,
                    ),
                    Gaps.gap8,
                    Text(
                      value,
                      style: context.textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Gaps.gap36,
                    Text(description, style: context.textTheme.bodyLarge),
                  ],
                ),
              ),
            ),
          ),
        );

}

