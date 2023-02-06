import 'package:equatable/equatable.dart';

import '../entities/firebase_user.dart';

abstract class UserRepository extends Equatable {
  Future<bool> addNewUser({required FirebaseUser firebaseUser});

  Future<FirebaseUser> getUserByUid({required String uid});
}
