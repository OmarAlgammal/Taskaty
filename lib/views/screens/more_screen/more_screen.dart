import 'package:flutter/material.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/views/widgets/singl_divider.dart';

import '../../../repositories/remote_service_repos/auth_repo.dart';
import '../../widgets/payment_comp.dart';
import 'components/settings_screen_email_info_com.dart';
import 'components/setttings_screen_theme_comp.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsScreenEmailInfoCom(locator<AuthRepo>().currentUser!),
            const SettingsScreenThemeCom(),
            gap24,
            const Text('Payment'),
            const SingleDivider(),
            Padding(
              padding: paddingVV18,
              child: FutureBuilder(
                future: context.paymentRepo.getPaymentDetails(),
                builder: (context, snapshot){
                  debugPrint('snapshot : ${snapshot.data?.isRight}');
                  if (snapshot.hasData && snapshot.data != null && snapshot.data!.isRight){
                    return Text('You have subscribed to ${snapshot.data!.right.lastPayment.date.myDateFormat}',
                      style: context.textTheme.titleLarge,);
                  }
                  return const SizedBox();
                },
              ),
            ),
            PaymentComp(payForSubscription: false),
            PaymentComp(),
          ],
        ),
      ),
    );
  }


}
