import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:taskaty/core/errors/error.dart';
import 'package:taskaty/core/exceptions/dio_exceptions.dart';
import 'package:taskaty/core/network/constants/payment_api_constants.dart';
import 'package:taskaty/services/api/response_handler.dart';

import '../../utils/typedefs/typedef.dart';

abstract class BaseApiService {
  Future<Either<MyError, T>> get<T>(
      {required String path, required DataBuilder<T> dataBuilder});

  Future<Either<MyError, T>> post<T>(
      {required String path,
      required dynamic data,
      required DataBuilder<T> dataBuilder});
}

class ApiService implements BaseApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(BaseOptions(baseUrl: PaymentApiConstants.baseApiKey));
  }

  @override
  Future<Either<MyError, T>> get<T>(
      {required String path, required DataBuilder<T> dataBuilder}) async {
    try {
      final response = await _dio.get(path);
      return ResponseHandler.handleDioResponse<T>(response,
          dataBuilder: dataBuilder);
    } on DioException catch (error) {
      return Left(HandlingDioExceptions.handleDioException(error));
    }
  }

  @override
  Future<Either<MyError, T>> post<T>(
      {required String path,
      required dynamic data,
      required DataBuilder<T> dataBuilder}) async {
    try {
      final response = await _dio.post(path, data: data);
      return ResponseHandler.handleDioResponse<T>(response,
          dataBuilder: dataBuilder);
    } on DioException catch (error) {
      return Left(HandlingDioExceptions.handleDioException(error));
    }
  }
}
