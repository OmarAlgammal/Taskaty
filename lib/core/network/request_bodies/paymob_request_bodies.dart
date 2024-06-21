import 'package:taskaty/core/network/constants/payment_api_constants.dart';

class PaymobRequestBodies {
  static final authRequestBody = {
    "api_key": PaymentApiConstants.apiKey,
  };

  static orderRegistrationBody(
          {required String authToken, required int amount}) =>
      {
        "auth_token": authToken,
        "delivery_needed": "false",
        "amount_cents": amount.toString(),
        "currency": "EGP",
        "items": []
      };

  static paymentKeyRequestBody(
          {required String authToken,
          required int orderRegistrationId,
          required int amount}) =>
      {
        "auth_token": authToken,
        "amount_cents": (amount * 100).toString(),
        "expiration": 3600,
        "order_id": orderRegistrationId.toString(),
        "billing_data": {
          "apartment": "NA",
          "email": "NA",
          "floor": "NA",
          "first_name": "NA",
          "street": "NA",
          "building": "NA",
          "phone_number": "NA",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "NA",
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": PaymentApiConstants.onlineCardIntegrationId
      };
}
