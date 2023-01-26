import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/firebase_auth_repository.dart';

class SignInWithEmailAndPasswordUseCase {
  final FirebaseAuthRepository firebaseAuthRepository;

  const SignInWithEmailAndPasswordUseCase(
      {required this.firebaseAuthRepository});

  Future<User?> call({required String email, required String password}) async {
    return firebaseAuthRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
