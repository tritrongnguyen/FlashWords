import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthRepository extends Equatable {
  Future<bool> isSignIn();

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<User?> signUpWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  });

  Future<User?> signInWithGoogle();

  Future<void> signOut();
}
