import 'package:flutter/material.dart';
import 'package:taskaty/core/network/constants/payment_api_constants.dart';
import 'package:taskaty/models/navigation_models/payment_screen_model.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/helper/alert_dailog_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../models/payment_models/payment_transaction_model.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final paymentScreenModel = ModalRoute.of(context)!.settings.arguments as PaymentScreenModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(paymentScreenModel.payForSubscription ? 'pay for subscription' : 'Say thanks'),
      ),
      body: Center(
        child: FutureBuilder(
          future: context.paymentRepo.getPaymentKeyRequest(amount: paymentScreenModel.amount),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final url = PaymentApiConstants.paymentFramUrl(
                  token: snapshot.data!.right.token);
              return WebViewWidget(
                controller: WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..loadRequest(Uri.parse(url))
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onUrlChange: (url) {},
                      onNavigationRequest: (NavigationRequest request) async {
                        if (request.url.contains('success')) {
                          final params = Uri.parse(request.url).queryParameters;
                          final response =
                              PaymentTransactionModel.fromJson(params);
                          if (response.success && paymentScreenModel.payForSubscription){
                            await context.paymentRepo.savePaymentDetails(paymentTransactionModel: response);
                          }
                          Navigator.pop(context);
                          alertDialogHelper(context: context, paidSuccessfully: response.success);
                          return NavigationDecision.prevent;
                        }
                        return NavigationDecision.navigate;
                      },
                    ),
                  ),
              );
            }
            return const Text('Loading..');
          },
        ),
      ),
    );
  }
}
