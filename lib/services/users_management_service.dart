import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserManagementService {
  final _firebaseStore = FirebaseFirestore.instance;

  Future<void> addUser({required UserModel user}) async {
    await _firebaseStore.collection('users').doc(user.id).set({
      'userName': user.userName,
      'email': user.email,
      'type': user.type,
    });
  }
}
