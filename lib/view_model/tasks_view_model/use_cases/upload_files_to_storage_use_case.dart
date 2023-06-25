
import 'package:either_dart/either.dart';
import 'package:taskaty/core/errors/failure.dart';
import 'package:taskaty/databases/storage_database.dart';

abstract class BaseUploadFilesToStorageUseCase{

  Future<Either<ServerFailure, List<String>>> uploadFiles({required List<String> paths});
  Future<Either<ServerFailure, void>> deleteFiles({required List<String> paths});
}

class UploadFilesToStorageUseCase implements BaseUploadFilesToStorageUseCase{

  final BaseStorageDatabase _baseStorageDatabase;
  UploadFilesToStorageUseCase(this._baseStorageDatabase);
  @override
  Future<Either<ServerFailure, void>> deleteFiles({required List<String> paths}) {
    // TODO: implement deleteFile
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailure, List<String>>> uploadFiles({required List<String> paths}) async{
    return await _baseStorageDatabase.uploadFiles(paths);
  }
}