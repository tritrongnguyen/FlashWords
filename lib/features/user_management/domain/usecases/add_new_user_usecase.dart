import '../entities/firebase_user.dart';
import '../repositories/user_repository.dart';

class AddNewUserUseCase {
  final UserRepository userRepository;

  AddNewUserUseCase(this.userRepository);

  Future<bool> call({required FirebaseUser firebaseUser}) {
    return userRepository.addNewUser(firebaseUser: firebaseUser);
  }
}
