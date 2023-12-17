import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskaty/core/network/constants/payment_api_constants.dart';
import 'package:taskaty/core/network/request_bodies/paymob_request_bodies.dart';
import 'package:taskaty/models/payment_models/order_registration_respond.dart';
import 'package:taskaty/models/payment_models/payment_transaction_model.dart';
import 'package:taskaty/repositories/remote_service_repos/auth_repo.dart';
import 'package:taskaty/services/firebase/firestore_sevrvice.dart';

import '../../core/errors/error.dart';
import '../../models/payment_models/retrieve_payment_model.dart';
import '../../services/api/api_service.dart';

abstract class BasePaymentRepo {

  Future<Either<MyError, int>> getPaymentPrice(
      {required bool forRegistration});
  Future<
          Either<MyError,
              ({RetrievePaymentModel retrievePaymentModel, String token})>>
      getPaymentKeyRequest({required int amount});

  Future<Either<MyError, ({List<PaymentTransactionModel> all, PaymentTransactionModel lastPayment})>> getPaymentDetails();

  Future<Either<MyError, void>> savePaymentDetails(
      {required PaymentTransactionModel paymentTransactionModel});

  /// TODO: Complete this method
// Future<Either<ServerError, PaymentTransactionModel>> retrievePaymentTransaction();
}

class PaymentRepo implements BasePaymentRepo {
  final BaseAuthRepo _baseAuthRepo;
  final BaseFireStoreService _baseFireStoreService;
  final BaseApiService _baseApiService;

  PaymentRepo(
      this._baseAuthRepo, this._baseApiService, this._baseFireStoreService);

  @override
  Future<Either<MyError, int>> getPaymentPrice(
      {required bool forRegistration}) async {
    return _baseFireStoreService.getDoc<int>(
        getOptions: const GetOptions(source: Source.server),
        path: '${_baseAuthRepo.currentUser!.uid}/pricing',
        dataBuilder: (map) => map[forRegistration ? 'registration' : 'sayThanks']);
  }

  @override
  Future<Either<MyError, ({RetrievePaymentModel retrievePaymentModel, String token})>>
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

  /// TODO: Create this payment path in a separated file
  @override
  Future<Either<MyError, ({List<PaymentTransactionModel> all, PaymentTransactionModel lastPayment})>> getPaymentDetails() async {
    final path = '${_baseAuthRepo.currentUser!.uid}/payments/all';
    final allPaymentProcess = await _baseFireStoreService.getCollection<PaymentTransactionModel>(
        path: path,
        dataBuilder: (map) => PaymentTransactionModel.fromJson(map));
    if (allPaymentProcess.isLeft){
      return Left(allPaymentProcess.left);
    }
    return Right((all: allPaymentProcess.right, lastPayment: allPaymentProcess.right.last));
  }

  @override
  Future<Either<MyError, void>> savePaymentDetails(
      {required PaymentTransactionModel paymentTransactionModel}) async {
    return await _baseFireStoreService.setData(
        path:
            '${_baseAuthRepo.currentUser!.uid}/payments/all/${paymentTransactionModel.transactionID}',
        map: paymentTransactionModel.toJson());
  }



  /// TODO: Complete this method

// @override
// Future<Either<ServerError, PaymentTransactionModel>> retrievePaymentTransaction() sync{
//   // return await _baseApiService.get(path: PaymentApiConstants.paymentTransaction(transactionId), dataBuilder: dataBuilder)
// }
}
