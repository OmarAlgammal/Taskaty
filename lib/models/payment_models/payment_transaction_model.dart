

class PaymentTransactionModel {
  bool success;
  String? transactionId;
  String? responseCode;
  String? message;
  DateTime date;
  DateTime expiryDate;

  PaymentTransactionModel._({
    this.transactionId,
    required this.success,
    this.responseCode,
    this.message,
    required this.date,
    required this.expiryDate,
  });

  factory PaymentTransactionModel.fromJson(Map<String, dynamic> json) => PaymentTransactionModel._(
    success: json['success'] == 'true',
    transactionId: json['id'],
    message: json['message'],
    responseCode: json['txn_response_code'],
    date: DateTime.parse(json['date']) ?? DateTime.now(),
    expiryDate: DateTime.parse(json['expiryDate']) ?? DateTime.now().add(const Duration(days: 365)),
  );


  Map<String, dynamic> toJson() => {
    'success': success.toString(),
    'id': transactionId,
    'message': message,
    'txn_response_code': responseCode,
    'date': date.toIso8601String(),
    'expiryDate': expiryDate.toIso8601String(),
  };


}
