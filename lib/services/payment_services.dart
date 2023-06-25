import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';

import '../core/errors/failure.dart';
import '../core/mappers/paymob_mappers.dart';
import '../core/network/constants/payment_api_constants.dart';

abstract class BasePaymentService {
  Future<Either<Failure, String>> payWithWallet({
    required String phoneNumber,
    required int amount,
  });

  Future<Either<Failure, String>> _payRequest({
    required String paymentToken,
    required String phoneNumber,
  });

  Future<Either<Failure, String>> _getToken();

  Future<Either<Failure, String>> _orderRegistrationApi({
    required String authToken,
    required int amount,
  });

  Future<Either<Failure, String>> _getPaymentKeyRequestApi({
    required String authToken,
    required String orderId,
    required String phoneNumber,
    required int amount,
  });
}

class PaymentService implements BasePaymentService {
  late final Dio _dio;

  PaymentService() {
    _dio = Dio(BaseOptions(baseUrl: PaymentApiConstants.baseApiKey));
    debugPrint('all is well');
  }

  @override
  Future<Either<Failure, String>> payWithWallet(
      {required String phoneNumber, required int amount}) async {
    final tokenResult = await _getToken();
    if (tokenResult.isLeft) return Left(tokenResult.left);
    debugPrint('one passed');
    final orderRegistrationApiResult = await _orderRegistrationApi(
        authToken: tokenResult.right, amount: amount);
    if (orderRegistrationApiResult.isLeft)
      return Left(orderRegistrationApiResult.left);
    debugPrint('two passed');
    final paymentKeyRequestResult = await _getPaymentKeyRequestApi(
        authToken: tokenResult.right,
        orderId: orderRegistrationApiResult.right,
        phoneNumber: phoneNumber,
        amount: amount);
    if (paymentKeyRequestResult.isLeft)
      return Left(paymentKeyRequestResult.left);
    debugPrint('three passed');
    final payRequestResult = await _payRequest(
        paymentToken: paymentKeyRequestResult.right, phoneNumber: phoneNumber);
    if (payRequestResult.isLeft) return Left(payRequestResult.left);
    debugPrint('four passed and url : ${payRequestResult.right}');
    return Right(payRequestResult.right);
  }

  @override
  Future<Either<Failure, String>> _payRequest(
      {required String paymentToken, required String phoneNumber}) async {
    return _getData(
        key: 'redirection_url',
        apiKey: PaymentApiConstants.payRequestApiKey,
        data: PaymobMappers.walletPayRequest(
            phoneNumber: phoneNumber, paymentToken: paymentToken));
  }

  @override
  Future<Either<Failure, String>> _getToken() async {
    return _getData(
        key: 'token',
        apiKey: PaymentApiConstants.tokenApiKey,
        data: PaymobMappers.getTokenMap);
  }

  @override
  Future<Either<Failure, String>> _orderRegistrationApi(
      {required String authToken, required int amount}) {
    return _getData(
      key: 'id',
      apiKey: PaymentApiConstants.orderRegistrationApiKey,
      data: PaymobMappers.registrationMap(authToken: authToken, amount: amount),
    );
  }

  @override
  Future<Either<Failure, String>> _getPaymentKeyRequestApi(
      {required String authToken,
      required String orderId,
      required String phoneNumber,
      required int amount}) {
    return _getData(
      key: 'token',
      apiKey: PaymentApiConstants.paymentKeyRequestApiKey,
      data: PaymobMappers.paymentKeyMap(
          authToken: authToken,
          orderId: orderId,
          phoneNumber: phoneNumber,
          amount: amount),
    );
  }

  Future<Either<Failure, String>> _getData(
      {required String key,
      required String apiKey,
      required Map<String, dynamic> data}) async {
    try {
      final response = await _dio.post(apiKey, data: data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(response.data[key].toString());
      }
      return Left(ServerFailure(message: 'Token not found'));
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return Left(TimeoutFailure(message: 'Time out'));
        case DioExceptionType.badCertificate:
        case DioExceptionType.badResponse:
        case DioExceptionType.unknown:
        case DioExceptionType.cancel:
          return Left(BadResponseFailure(message: 'Bad response'));
        case DioExceptionType.connectionError:
          return Left(
              InternetConnectionFailure(message: 'Internet connection error'));
        default:
          return Left(BadResponseFailure(message: 'Bad response'));
      }
    }
  }
}
