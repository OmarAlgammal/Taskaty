
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@Freezed()
class Failure with _$Failure{
  factory Failure.serverFailure({required String message}) = ServerFailure;
  factory Failure.internetConnectionFailure({required String message}) = InternetConnectionFailure;
  factory Failure.timeoutFailure({required String message}) = TimeoutFailure;
  factory Failure.badeResponseFailure({required String message}) = BadResponseFailure;
}
