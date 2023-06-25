
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_states.freezed.dart';

@Freezed()
class PaymentStates with _$PaymentStates{

  factory PaymentStates.paymentInProgress() = PaymentInProgress;
  factory PaymentStates.paymentCompletedSuccessfully() = PaymentCompletedSuccessfully;
  factory PaymentStates.paymentFailed() = PaymentFailed;
}