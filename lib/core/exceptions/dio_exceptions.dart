import 'package:dio/dio.dart';

import '../errors/error.dart';

class HandlingDioExceptions {
  static MyError handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutError(message: 'Time out');
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
      case DioExceptionType.cancel:
        return BadResponseError(message: 'Bad response');
      case DioExceptionType.connectionError:
        return InternetConnectionError(message: 'Internet connection error');
      default:
        return BadResponseError(message: 'Bad response');
    }
  }
}
