import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/models/navigation_models/payment_screen_model.dart';
import 'package:taskaty/routing/routes.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

import '../../../../utils/constance/my_padding.dart';
import '../../../../utils/constance/icons.dart';

class PaymentComp extends StatelessWidget {
  PaymentComp({super.key, this.payForSubscription = true});

  final bool payForSubscription;
  int? amount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (amount != null){
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
      title: Text(payForSubscription ? AppLocal.subscribe.getString(context) : AppLocal.sayThanks.getString(context)),
      trailing: FutureBuilder(
        future: context.firebasePaymentViewModel
            .getPaymentPrice(payForSubscription),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text(AppLocal.loading.getString(context));
          }
          if (snapshot.data != null && snapshot.data!.isRight) {
            amount = snapshot.data!.right;
            return Text('${snapshot.data!.right} EGP');
          }
          return Text(AppLocal.error.getString(context));
        },
      ),
    );
  }
}
