import 'package:either_dart/either.dart';
import 'package:taskaty/repositories/remote_service_repos/payment_repo.dart';

import '../../core/errors/error.dart';
import '../../models/payment_models/retrieve_payment_model.dart';

class PaymentViewModel{
  final BasePaymentRepo _basePaymentRepo;

  PaymentViewModel(this._basePaymentRepo);

  Future<
      Either<MyError,
          ({RetrievePaymentModel retrievePaymentModel, String token})>>
  getPaymentKeyRequest({required int amount}) async{
    return await _basePaymentRepo.getPaymentKeyRequest(amount: amount);
  }
}