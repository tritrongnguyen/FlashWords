import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/firebase_user.dart';

class FirebaseUserModel extends FirebaseUser {
  const FirebaseUserModel({
    required String? id,
    required String? userName,
    required String? email,
    required Type type,
  }) : super(
          id: id,
          userName: userName,
          email: email,
          type: type,
        );

  factory FirebaseUserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return FirebaseUserModel(
      id: snapshot.id,
      userName: data?['userName'],
      email: data?['email'],
      type: data?['type'] == 'google' ? Type.google : Type.emailAndPassword,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userName': userName,
      'email': email,
      'type': type.name,
    };
  }

  @override
  List<Object?> get props => [id, userName, email, type];
}
