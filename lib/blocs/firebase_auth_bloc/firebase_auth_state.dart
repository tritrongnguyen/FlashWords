part of 'firebase_auth_bloc.dart';

@immutable
abstract class FirebaseAuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FirebaseAuthLoading extends FirebaseAuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FirebaseAuthenticated extends FirebaseAuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FirebaseUnAuthenticated extends FirebaseAuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FirebaseAuthFailed extends FirebaseAuthState {
  final String err;

  FirebaseAuthFailed(this.err);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
