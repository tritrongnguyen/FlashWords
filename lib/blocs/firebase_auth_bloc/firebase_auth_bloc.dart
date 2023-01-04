import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../services/firebase_auth_service.dart';

part 'firebase_auth_event.dart';
part 'firebase_auth_state.dart';

class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  final FirebaseAuthService firebaseAuthService;

  FirebaseAuthBloc({required this.firebaseAuthService})
      : super(FirebaseUnAuthenticated()) {
    on<SignInRequested>((event, emit) async {
      emit(FirebaseAuthLoading());
      try {
        await firebaseAuthService.signIn(
          email: event.email,
          password: event.password,
        );
        emit(FirebaseAuthenticated());
      } catch (e) {
        emit(FirebaseAuthFailed(e.toString()));
        emit(FirebaseUnAuthenticated());
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(FirebaseAuthLoading());
      try {
        await firebaseAuthService.signUp(
          email: event.email,
          password: event.password,
        );
        emit(FirebaseAuthenticated());
      } catch (e) {
        emit(FirebaseAuthFailed(e.toString()));
        emit(FirebaseUnAuthenticated());
      }
    });

    on<GoogleSignInRequested>((event, emit) async {
      emit(FirebaseAuthLoading());
      try {
        await firebaseAuthService.signInWithGoogle();

        emit(FirebaseAuthenticated());
      } catch (e) {
        emit(FirebaseAuthFailed(e.toString()));
        emit(FirebaseUnAuthenticated());
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(FirebaseAuthLoading());
      await firebaseAuthService.signOut();
      emit(FirebaseUnAuthenticated());
    });
  }
}
