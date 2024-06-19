import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 class PaymentTypeViewModel extends ChangeNotifier{
   bool sayThanksSelected = true;

   static PaymentTypeViewModel instance(BuildContext context) => Provider.of<PaymentTypeViewModel>(context, listen: false);

   void changePaymentType(){
     sayThanksSelected = !sayThanksSelected;
     notifyListeners();
   }
 }