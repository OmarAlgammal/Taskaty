import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/constance/my_padding.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/view_model/selected_subscription_view_model/payment_type_view_model.dart';
import 'package:taskaty/views/screens/subscription_screen/comp/billed_advantages_comp.dart';
import 'package:taskaty/views/screens/subscription_screen/comp/billed_comp.dart';
import 'package:taskaty/views/screens/subscription_screen/comp/payment_button_comp.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: MyPadding.padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocal.subscribeToTaskaty.getString(context),
              style: context.textTheme.headlineMedium,
            ),
            Gaps.gap16,
            Expanded(
              child: ChangeNotifierProvider(
                create: (context) => PaymentTypeViewModel(),
                builder: (context, _) {
                  final payForSubscription =
                      Provider.of<PaymentTypeViewModel>(context).payForSubscription;
                  return Column(
                    children: [
                      BilledComp(payForSubscription: payForSubscription),
                      Gaps.gap24,
                      BilledAdvantagesComp(payForSubscription: payForSubscription),
                      Spacer(),
                      PaymentButtonComp(payForSubscription: payForSubscription),
                    ],
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
