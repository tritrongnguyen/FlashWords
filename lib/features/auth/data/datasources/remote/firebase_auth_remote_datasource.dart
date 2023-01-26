import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthRemoteDataSource {
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
