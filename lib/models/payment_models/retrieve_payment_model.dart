class RetrievePaymentModel {
  String authToken;
  String merchantOrderId;
  String orderId;

  RetrievePaymentModel(
      {required this.authToken,
      required this.merchantOrderId,
      required this.orderId,});

  factory RetrievePaymentModel.fromJson(Map<String, dynamic> json) =>
      RetrievePaymentModel(
        authToken: json['authToken'],
        merchantOrderId: json['merchantOrderId'],
        orderId: json['orderId'],
      );

  Map<String, dynamic> get toJson => {
        "auth_token": authToken,
        "merchant_order_id": merchantOrderId,
        "order_id": orderId,
      };
}
