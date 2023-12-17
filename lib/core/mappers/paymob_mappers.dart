import 'package:taskaty/core/network/constants/payment_api_constants.dart';

class PaymobMappers {
  static Map<String, dynamic> getTokenMap = {
    "api_key": PaymentApiConstants.apiKey,
  };

  static Map<String, dynamic> registrationMap(
          {required String authToken, required int amount}) =>
      {
        "auth_token": authToken,
        "delivery_needed": "false",
        "amount_cents": amount.toString(),
        "currency": "EGP",
        "items": []
      };

  static Map<String, dynamic> paymentKeyMap(
          {required String authToken,
          required String orderId,
            required String phoneNumber,
          required int amount}) =>
      {
        /// TODO: Send user information like email address, name, phone number
        "auth_token": authToken,
        "amount_cents": amount.toString(),
        "expiration": 3600,
        "order_id": orderId.toString(),
        "billing_data": {
          "apartment": "NA",
          "email": "omarprogramzone@gmail.com",
          "floor": "NA",
          "first_name": "Omar",
          "street": "NA",
          "building": "NA",
          "phone_number": phoneNumber,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "Algammal",
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": PaymentApiConstants.onlineCardIntegrationId,
      };

  static Map<String, dynamic> walletPayRequest({
    required String phoneNumber,
    required String paymentToken,
  }) =>
      {
        "source": {"identifier": phoneNumber.toString(), "subtype": "WALLET"},
        "payment_token": paymentToken,
      };
}
