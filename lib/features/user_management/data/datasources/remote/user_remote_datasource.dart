import '../../../domain/entities/firebase_user.dart';

abstract class UserRemoteDataSource {
  Future<bool> addNewUser({required FirebaseUser firebaseUser});

  Future<FirebaseUser> getUserByUid({required String uid});
}
