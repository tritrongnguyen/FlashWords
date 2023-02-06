import '../entities/firebase_user.dart';
import '../repositories/user_repository.dart';

class GetSingleUserByUidUseCase {
  final UserRepository userRepository;

  GetSingleUserByUidUseCase({required this.userRepository});

  Future<FirebaseUser> call({required String uid}) {
    return userRepository.getUserByUid(uid: uid);
  }
}
