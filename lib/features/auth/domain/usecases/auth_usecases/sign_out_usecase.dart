import '../../repositories/firebase_auth_repository.dart';

class SignOutUseCase {
  final FirebaseAuthRepository firebaseAuthRepository;

  const SignOutUseCase({required this.firebaseAuthRepository});

  Future<void> call() async {
    return firebaseAuthRepository.signOut();
  }
}
