part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginSubmitting extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginSucceed extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginFailed extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InvalidEmail extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ValidEmail extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InvalidPassword extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ValidPassword extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
