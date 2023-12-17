
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';

@Freezed()
class MyError with _$MyError{
  factory MyError.serverError({required String message}) = ServerError;
  factory MyError.internetConnectionError({required String message}) = InternetConnectionError;
  factory MyError.timeoutError({required String message}) = TimeoutError;
  factory MyError.badeResponseError({required String message}) = BadResponseError;
}
