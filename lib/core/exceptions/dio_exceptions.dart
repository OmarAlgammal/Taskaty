import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

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

  static MyError handleFirebaseException(FirebaseException error) {
    switch (error.code) {
      case 'network-request-failed':
        return InternetConnectionError(message: error.code);
      default:
        return BadResponseError(message: 'Bad response - ${error.message}');
    }
  }

}
