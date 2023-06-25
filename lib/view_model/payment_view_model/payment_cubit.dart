import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaty/core/errors/failure.dart';
import 'package:taskaty/databases/payment_database.dart';
import 'package:taskaty/view_model/payment_view_model/payment_states.dart';

class PaymentViewModel extends Cubit<PaymentStates>{
  final BasePaymentDatabase _basePaymentDatabase;

  PaymentViewModel(this._basePaymentDatabase) : super(PaymentInProgress());

  Future<Either<Failure, String>> payWithWallet({required String phoneNumber, required int amount}) async{
    final payWithWalletResult = await _basePaymentDatabase.payWithVodafoneWallet(phoneNumber: phoneNumber, amount: amount);
    return payWithWalletResult;
  }
}