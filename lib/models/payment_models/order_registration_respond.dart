class OrderRegistrationRespond {
  final int orderId;
  final int merchantId;

  OrderRegistrationRespond({required this.orderId, required this.merchantId});

  factory OrderRegistrationRespond.fromJson(Map<String, dynamic> json) =>
      OrderRegistrationRespond(
        orderId: json['id'],
        merchantId: json['merchant']['id'],
      );
}
