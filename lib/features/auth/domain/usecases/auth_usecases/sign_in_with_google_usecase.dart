import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/firebase_auth_repository.dart';

class SignInWithGoogleUseCase {
  final FirebaseAuthRepository firebaseAuthRepository;

  const SignInWithGoogleUseCase({required this.firebaseAuthRepository});

  Future<User?> call() async {
    return await firebaseAuthRepository.signInWithGoogle();
  }
}
