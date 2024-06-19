import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/view_model/selected_subscription_view_model/payment_type_view_model.dart';
import 'package:taskaty/views/screens/subscription_screen/comp/billed_advantages_comp.dart';
import 'package:taskaty/views/screens/subscription_screen/comp/billed_comp.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Subscribe to Taskaty', style: context.textTheme.headlineMedium,),
          Gaps.gap16,
          ChangeNotifierProvider(
            create: (context) => PaymentTypeViewModel(),
            builder: (context, _){
              final sayThanksSelected = Provider.of<PaymentTypeViewModel>(context).sayThanksSelected;
              return Column(
                children: [
                  BilledComp(sayThanksSelected: sayThanksSelected),
                  Gaps.gap24,
                  BilledAdvantagesComp(sayThanksSelected: sayThanksSelected),
                ],
              );
            },
          )

        ],
      ),
    );
  }
}
