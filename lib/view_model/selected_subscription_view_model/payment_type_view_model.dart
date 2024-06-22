import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 class PaymentTypeViewModel extends ChangeNotifier{
   bool payForSubscription = false;

   static PaymentTypeViewModel instance(BuildContext context) => Provider.of<PaymentTypeViewModel>(context, listen: false);

   void changePaymentType(){
     payForSubscription = !payForSubscription;
     notifyListeners();
   }
 }