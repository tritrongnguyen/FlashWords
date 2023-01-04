part of 'firebase_auth_bloc.dart';

@immutable
abstract class FirebaseAuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInRequested extends FirebaseAuthEvent {
  final String email;
  final String password;

  SignInRequested({
    required this.email,
    required this.password,
  });
}

class SignUpRequested extends FirebaseAuthEvent {
  final String email;
  final String password;

  SignUpRequested({
    required this.email,
    required this.password,
  });
}

class GoogleSignInRequested extends FirebaseAuthEvent {}

class SignOutRequested extends FirebaseAuthEvent {}
