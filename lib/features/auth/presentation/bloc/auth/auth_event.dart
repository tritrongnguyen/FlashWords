part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  const SignInRequested({required this.email, required this.password});
}

class SignUpRequested extends AuthEvent {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpRequested({
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

class GoogleSignInRequested extends AuthEvent {}

class SignOutRequested extends AuthEvent {}
