class PaymentApiConstants {
  static const String apiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0luQnliMlpwYkdWZmNHc2lPakkyTmpnM05pd2lZMnhoYzNNaU9pSk5aWEpqYUdGdWRDSjkud01WX25xUXBtYk1ZcXBTS2M3U3RjeElrUlF1Y1hGTU5MMzI2VXpadGo2eUZRUFpYOFZpVG1ycWsyU0kyblh2T3ZnbFVVUl9iVmRVbHh2bGNpTXo0R1E=';
  static const onlineCardIntegrationId = 4379027;

  static const String baseApiKey = "https://accept.paymob.com/api/";

  static const String authRequestApiKey = "${baseApiKey}auth/tokens";

  static const String orderRegistrationApiKey = "${baseApiKey}ecommerce/orders";

  static const String paymentKeyRequestApiKey =
      "${baseApiKey}acceptance/payment_keys";

  static String paymentTransaction(String transactionId) =>
      '$baseApiKey/acceptance/transactions/$transactionId';

  static String paymentFramUrl({required String token}) =>
      "${baseApiKey}acceptance/iframes/603861?payment_token=$token";

  static const String accessTokenApiKey =
      "https://access.sandbox.checkout.com/connect/token";

  static const String payRequestApiKey = "${baseApiKey}acceptance/payments/pay";
}
