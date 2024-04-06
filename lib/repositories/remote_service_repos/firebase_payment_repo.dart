import 'package:either_dart/either.dart';
import 'package:taskaty/core/network/constants/firestore_paths_constants.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';

import '../../core/errors/error.dart';
import '../../models/payment_models/payment_transaction_model.dart';
import '../../services/firebase/firestore_sevrvice.dart';
import 'auth_repo.dart';

abstract class BaseFirebasePaymentRepo {
  Future<Either<MyError, int>> getPaymentPrice({required bool forRegistration});

  Future<Either<MyError, void>> savePaymentDetails(
      {required PaymentTransactionModel paymentTransactionModel});

  Future<Either<MyError, bool>> isUserStillOnSubscriptionPeriod();

  Stream<PaymentTransactionModel> getLastPaymentProcess();

}

class FirebasePaymentRepo implements BaseFirebasePaymentRepo {
  final BaseFireStoreService _baseFireStoreService;
  final BaseAuthRepo _baseAuthRepo;

  FirebasePaymentRepo(this._baseFireStoreService, this._baseAuthRepo);

  @override
  Stream<PaymentTransactionModel> getLastPaymentProcess() {
    return _baseFireStoreService.getStreamCollection<PaymentTransactionModel>(
        path: FirestorePathsConstants.allPaymentsPath(
            _baseAuthRepo.currentUser!.uid),
        queryBuilder: (query) =>
            query.orderBy('date', descending: true).limit(1),
        querySnapshotBuilder: (snapshot) => PaymentTransactionModel.fromJson(
            snapshot.first.data() as Map<String, dynamic>));
  }

  @override
  Future<Either<MyError, int>> getPaymentPrice(
      {required bool forRegistration}) async {
    return _baseFireStoreService.getDoc<int>(
        path:
            FirestorePathsConstants.pricingPath,
        dataBuilder: (map) => map[forRegistration ? FirestorePathsConstants.registrationPath : FirestorePathsConstants.thanksPath]);
  }

  @override
  Future<Either<MyError, void>> savePaymentDetails(
      {required PaymentTransactionModel paymentTransactionModel}) async {
    return await _baseFireStoreService.setData(
        path: FirestorePathsConstants.savePaymentPath(
            _baseAuthRepo.currentUser!.uid,
            paymentTransactionModel.transactionId.toString()),
        map: paymentTransactionModel.toJson());
  }

  @override
  Future<Either<MyError, bool>> isUserStillOnSubscriptionPeriod() async {
    if (_baseAuthRepo.currentUser == null) return const Right(false);
    return await _baseFireStoreService.getCollection<bool>(
        path: FirestorePathsConstants.allPaymentsPath(
            _baseAuthRepo.currentUser!.uid),
        queryBuilder: (query) =>
            query.orderBy('date', descending: true).limit(1),
        querySnapshotBuilder: (querySnapshots) =>
            PaymentTransactionModel.fromJson(
                    querySnapshots.first.data() as Map<String, dynamic>)
                .expiryDate
                .isAfterNow);
  }
}
