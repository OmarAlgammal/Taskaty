import 'package:either_dart/either.dart';
import 'package:taskaty/core/errors/server_failure.dart';
import 'package:taskaty/services/storage_services.dart';

abstract class BaseStorageDatabase {
  Future<Either<ServerFailure, List<String>>> uploadFiles(List<String> paths);
}

class StorageDatabase implements BaseStorageDatabase {
  final BaseStorageService _baseStorageService;

  StorageDatabase(this._baseStorageService);

  @override
  Future<Either<ServerFailure, List<String>>> uploadFiles(List<String> paths) {
    return _baseStorageService.uploadFiles(paths);
  }
}
