import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskaty/core/errors/error.dart';

import '../../services/firebase/firebase_auth.dart';

abstract class BaseAuthRepo {
  User? get currentUser;

  Stream<User?> authStateChanges();

  Future<Either<MyError, UserCredential>> signInWithGoogle();

  Future<void> signOut();
}

class AuthRepo implements BaseAuthRepo {
  final BaseAuthServices _baseAuthServices;

  AuthRepo(this._baseAuthServices);

  @override
  User? get currentUser => _baseAuthServices.currentUser;

  @override
  Future<void> signOut() async {
    await _baseAuthServices.signOut();
  }

  @override
  Future<Either<MyError, UserCredential>> signInWithGoogle() async {
    return _baseAuthServices.signInWithGoogle();
  }

  @override
  Stream<User?> authStateChanges() {
    return _baseAuthServices.authStateChanges();
  }
}
