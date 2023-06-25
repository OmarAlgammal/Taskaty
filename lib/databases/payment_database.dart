import 'package:either_dart/either.dart';
import 'package:taskaty/core/errors/failure.dart';
import 'package:taskaty/services/payment_services.dart';

abstract class BasePaymentDatabase {
  Future<Either<Failure, String>> payWithVodafoneWallet(
      {required String phoneNumber, required int amount});
}

class PaymentDatabase implements BasePaymentDatabase {
  final PaymentService _paymentService;

  PaymentDatabase(this._paymentService);

  @override
  Future<Either<Failure, String>> payWithVodafoneWallet(
      {required String phoneNumber, required int amount}) async {
    return await _paymentService.payWithWallet(
        phoneNumber: phoneNumber, amount: amount);
  }
}
