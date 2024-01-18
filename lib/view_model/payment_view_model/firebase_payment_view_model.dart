import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';

import '../../core/errors/error.dart';
import '../../models/payment_models/payment_transaction_model.dart';
import '../../repositories/remote_service_repos/firebase_payment_repo.dart';

class FirebasePaymentViewModel {
  final BaseFirebasePaymentRepo _baseFirebasePaymentRepo;

  bool _userOnSubscriptionPeriod = false;

  bool get userOnSubscriptionPeriod => _userOnSubscriptionPeriod;

  FirebasePaymentViewModel(this._baseFirebasePaymentRepo);

  Future<Either<MyError, int>> getPaymentPrice(bool forRegistration) {
    return _baseFirebasePaymentRepo.getPaymentPrice(
        forRegistration: forRegistration);
  }

  Future<Either<MyError, void>> savePaymentDetails(
      {required PaymentTransactionModel paymentTransactionModel}) {
    _userOnSubscriptionPeriod = paymentTransactionModel.expiryDate.isAfterNow;
    return _baseFirebasePaymentRepo.savePaymentDetails(
        paymentTransactionModel: paymentTransactionModel);
  }

  Future<void> isUserStillOnSubscriptionPeriod() async {
    final result = await _baseFirebasePaymentRepo.isUserStillOnSubscriptionPeriod();
    if (result.isRight){
      _userOnSubscriptionPeriod = result.right;
    }
  }

  Stream<PaymentTransactionModel> getLastPaymentProcess(){
    return _baseFirebasePaymentRepo.getLastPaymentProcess();
  }
}
