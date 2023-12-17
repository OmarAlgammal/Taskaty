import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taskaty/core/errors/error.dart';

abstract class BaseAuthServices {
  Stream<User?> authStateChanges();

  User? get currentUser;

  Future<Either<ServerError, UserCredential>> signInWithGoogle();

  Future<void> signOut();
}

class AuthServices implements BaseAuthServices {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<Either<ServerError, UserCredential>> signInWithGoogle() async {
    try {

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return Right(userCredential);
    } on FirebaseException catch (e) {
      return Left(ServerError(message: 'error : ${e.message}'));
    } catch (e) {
      return Left(ServerError(
          message: 'An error occurred while signing in with Google : ${e.toString()}'));
    }
  }
}
