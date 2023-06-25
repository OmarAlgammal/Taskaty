import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskaty/core/errors/failure.dart';
import 'package:taskaty/services/firebase_auth.dart';

abstract class BaseAuthDatabase {
  User get currentUser;

  Future<Either<ServerFailure, UserCredential>> signInWithGoogle();

  Future<void> signOut();
}

class AuthDatabase implements BaseAuthDatabase {
  final BaseAuthServices _baseAuthServices;

  AuthDatabase(this._baseAuthServices);

  @override
  User get currentUser => _baseAuthServices.currentUser;

  @override
  Future<void> signOut() async {
    await _baseAuthServices.signOut();
  }

  @override
  Future<Either<ServerFailure, UserCredential>> signInWithGoogle() async {
    return _baseAuthServices.signInWithGoogle();
  }
}
