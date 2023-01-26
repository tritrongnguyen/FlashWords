import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/firebase_auth_repository.dart';

class SignUpWithEmailAndPasswordUseCase {
  final FirebaseAuthRepository firebaseAuthRepository;

  const SignUpWithEmailAndPasswordUseCase(
      {required this.firebaseAuthRepository});

  Future<User?> call(
      {required String userName,
      required String email,
      required String password}) async {
    return firebaseAuthRepository.signUpWithEmailAndPassword(
      userName: userName,
      email: email,
      password: password,
    );
  }
}
