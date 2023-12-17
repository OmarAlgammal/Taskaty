import 'package:paymob_payment/paymob_payment.dart';

class PaymentTransactionModel {
  bool success;
  String? transactionID;
  String? responseCode;
  String? message;
  DateTime date;

  PaymentTransactionModel._({
    this.transactionID,
    required this.success,
    this.responseCode,
    this.message,
    required this.date,
  });

  factory PaymentTransactionModel.fromJson(Map<String, dynamic> json) => PaymentTransactionModel._(
    success: json['success'] == 'true',
    transactionID: json['id'],
    message: json['message'],
    responseCode: json['txn_response_code'],
    date: DateTime.now(),
  );


  Map<String, dynamic> toJson() => {
    'success': success.toString(),
    'id': transactionID,
    'message': message,
    'txn_response_code': responseCode,
    'date': date.toIso8601String(),
  };


}
