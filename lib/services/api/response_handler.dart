import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../core/errors/error.dart';
import '../../utils/typedefs/typedef.dart';


/// TODO: Transfer this class to a suitable directory

class ResponseHandler {
  static Either<MyError, T> handleDioResponse<T>(Response response,
      {required DataBuilder<T> dataBuilder}) {
    if (response.statusCode == 201) {
      return Right(dataBuilder(response.data));
    }
    return Left(ServerError(message: 'Server error ${response.statusCode}'));
  }
}
