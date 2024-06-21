import 'package:either_dart/either.dart';
import 'package:taskaty/core/network/constants/payment_api_constants.dart';
import 'package:taskaty/core/network/request_bodies/paymob_request_bodies.dart';
import 'package:taskaty/models/payment_models/order_registration_respond.dart';

import '../../core/errors/error.dart';
import '../../models/payment_models/retrieve_payment_model.dart';
import '../../services/api/api_service.dart';

abstract class BasePaymentRepo {
  Future<
          Either<MyError,
              ({RetrievePaymentModel retrievePaymentModel, String token})>>
      getPaymentKeyRequest({required int amount});

  /// TODO: ِِAdd this method
// Future<Either<ServerError, PaymentTransactionModel>> retrievePaymentTransaction();
}

class PaymentRepo implements BasePaymentRepo {
  final BaseApiService _baseApiService;

  PaymentRepo(
    this._baseApiService,
  );

  @override
  Future<
          Either<MyError,
              ({RetrievePaymentModel retrievePaymentModel, String token})>>
      getPaymentKeyRequest({required int amount}) async {
    final authToken = await _authRequest();
    if (authToken.isLeft) {
      return Left(authToken.left);
    }

    final orderRegistrationId =
        await _orderRegistration(authToken: authToken.right, amount: amount);
    if (orderRegistrationId.isLeft) {
      return Left(orderRegistrationId.left);
    }

    final paymentKeyRequest = await _paymentKeyRequest(
        authToken: authToken.right,
        orderRegistrationId: orderRegistrationId.right.orderId,
        amount: amount);
    if (paymentKeyRequest.isLeft) {
      return Left(paymentKeyRequest.left);
    }

    return Right((
      retrievePaymentModel: RetrievePaymentModel(
        authToken: authToken.right,
        merchantOrderId: orderRegistrationId.right.merchantId.toString(),
        orderId: orderRegistrationId.right.orderId.toString(),
      ),
      token: paymentKeyRequest.right
    ));
  }

  Future<Either<MyError, String>> _authRequest() async {
    return await _baseApiService.post<String>(
        path: PaymentApiConstants.authRequestApiKey,
        data: PaymobRequestBodies.authRequestBody,
        dataBuilder: (map) => map!['token']);
  }

  Future<Either<MyError, OrderRegistrationRespond>> _orderRegistration(
      {required String authToken, required int amount}) async {
    return await _baseApiService.post<OrderRegistrationRespond>(
        path: PaymentApiConstants.orderRegistrationApiKey,
        data: PaymobRequestBodies.orderRegistrationBody(
            authToken: authToken, amount: amount),
        dataBuilder: (map) => OrderRegistrationRespond.fromJson(map!));
  }

  Future<Either<MyError, String>> _paymentKeyRequest(
      {required String authToken,
      required int orderRegistrationId,
      required int amount}) async {
    return await _baseApiService.post<String>(
        path: PaymentApiConstants.paymentKeyRequestApiKey,
        data: PaymobRequestBodies.paymentKeyRequestBody(
            authToken: authToken,
            orderRegistrationId: orderRegistrationId,
            amount: amount),
        dataBuilder: (map) => map!['token']);
  }
}
