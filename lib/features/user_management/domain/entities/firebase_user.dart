import 'package:equatable/equatable.dart';

enum Type {
  emailAndPassword,
  google,
  facebook,
  apple,
}

class FirebaseUser extends Equatable {
  final String? id;
  final String? userName;
  final String? email;
  final Type type;

  const FirebaseUser({
    this.id,
    this.userName,
    this.email,
    required this.type,
  });

  @override
  List<Object?> get props => [id, email, userName, type];
}
