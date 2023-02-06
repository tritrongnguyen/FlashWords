import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/firebase_user.dart';
import '../../models/firebase_user_model.dart';
import 'user_remote_datasource.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  UserRemoteDataSourceImpl({
    required this.firebaseFirestore,
  });

  @override
  Future<bool> addNewUser({required FirebaseUser firebaseUser}) async {
    try {
      await firebaseFirestore.collection('users').doc(firebaseUser.id).set({
        'userName': firebaseUser.userName,
        'email': firebaseUser.email,
        'type': firebaseUser.type.name,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<FirebaseUser> getUserByUid({required String uid}) async {
    final docRef = firebaseFirestore.collection('users').doc(uid).withConverter(
          fromFirestore: FirebaseUserModel.fromFirestore,
          toFirestore: (FirebaseUserModel firebase_user_model, _) =>
              firebase_user_model.toFirestore(),
        );
    final docSnap = await docRef.get();
    final firebaseUser = docSnap.data();

    if (firebaseUser != null) {
      return firebaseUser;
    } else {
      throw Exception();
    }
  }
}
