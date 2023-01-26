import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/firebase_user.dart';

class FirebaseUserModel extends FirebaseUser {
  const FirebaseUserModel({
    required String id,
    required String userName,
    required String email,
    required Type type,
  }) : super(
          id: id,
          userName: userName,
          email: email,
          type: type,
        );

  factory FirebaseUserModel.fromSnapShot(DocumentSnapshot snapshot) {
    return FirebaseUserModel(
      id: snapshot.id,
      userName: snapshot.get('userName'),
      email: snapshot.get('email'),
      type: snapshot.get('type'),
    );
  }

  @override
  List<Object?> get props => [id, userName, email, type];
}
