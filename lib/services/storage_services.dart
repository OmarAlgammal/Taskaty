import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../core/errors/failure.dart';

abstract class BaseStorageService {
  Future<Either<ServerFailure, List<String>>> uploadFiles(
      List<String> filesPaths);
}

class StorageService implements BaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// TODO: User Either with this method and handle exceptions from firebase or any exception
  @override
  Future<Either<ServerFailure, List<String>>> uploadFiles(
      List<String> filesPaths) async {
    try {
      List<String> filesUrl = [];

      /// TODO: Separate upload file and download link to two methods
      for (final path in filesPaths) {
        final task = await _storage
            .ref()
            .child(DateTime.now().toString())
            .putFile(File(path));
        final url = await task.ref.getDownloadURL();
        filesUrl.add(url);
      }
      return Right(filesUrl);
      // Filter list to get files not uploaded to firebase storage
      // List<String> filesPathsToUpload = filesPaths.where((file) => ! file.contains('http')).toList();
      // // Upload filesPaths to firebase storage
      // final List<String> urls = await Future.wait(filesPathsToUpload.map((e) async{
      //   final result = await _storage.ref(DateTime.now().toString()).putFile(File(e));
      //   return e;
      //   //return await result.ref.getDownloadURL();
      // }));
      // filesPaths.removeWhere((file) => file.contains('http'));
      // filesPaths.addAll(urls);
      return Right(filesPaths);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: 'Firebase exception : ${e.toString()}'));
    } catch (e) {
      return Left(ServerFailure(message: 'Error : ${e.toString()}'));
    }
  }
}
