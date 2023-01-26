import '../../repositories/firebase_auth_repository.dart';

class IsSignInUseCase {
  final FirebaseAuthRepository firebaseAuthRepository;

  const IsSignInUseCase({required this.firebaseAuthRepository});

  Future<bool> call() async {
    return firebaseAuthRepository.isSignIn();
  }
}
