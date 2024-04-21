import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/my_padding.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/views/widgets/single_divider.dart';

import '../../../repositories/remote_service_repos/auth_repo.dart';
import 'components/payment_comp_more_screen.dart';
import 'components/email_info_comp_more_screen.dart';
import 'components/theme_comp_more_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {


  @override
  void didChangeDependencies() {
    setState(() {
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocal.more.getString(context),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: MyPadding.padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsScreenEmailInfoCom(locator<AuthRepo>().currentUser!),
            const SettingsScreenThemeCom(),
            Gaps.gap24,
            Text(AppLocal.payment.getString(context)),
            const SingleDivider(),
            Padding(padding:
            MyPadding.paddingVV18,
              child: StreamBuilder(
                stream: context.firebasePaymentViewModel.getLastPaymentProcess(),
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.active){
                    if (snapshot.data != null){
                      return Text('You have subscribed until ${snapshot.data!.expiryDate.myDateFormat}',
                        style: context.textTheme.titleLarge,);
                    }
                  }
                  return const SizedBox();
                },
              ),
            ),
            // // Padding(
            // //   padding: paddingVV18,
            // //   child: FutureBuilder(
            // //     future: context.paymentRepo.getPaymentDetails(),
            // //     builder: (context, snapshot){
            // //       debugPrint('snapshot : ${snapshot.data?.isRight}');
            // //       if (snapshot.hasData && snapshot.data != null && snapshot.data!.isRight){
            // //         return Text('You have subscribed to ${snapshot.data!.right.lastPayment.date.myDateFormat}',
            // //           style: context.textTheme.titleLarge,);
            // //       }
            // //       return const SizedBox();
            // //     },
            // //   ),
            // ),
            PaymentComp(payForSubscription: false),
            PaymentComp(),
          ],
        ),
      ),
    );
  }


}
