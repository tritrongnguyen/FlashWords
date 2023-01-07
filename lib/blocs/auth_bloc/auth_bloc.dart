import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(UnAuthenticated()) {
    //
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        User? user = await authService.signIn(
          email: event.email,
          password: event.password,
        );
        if (user != null) {
          emit(Authenticated(user));
        }
      } catch (e) {
        emit(AuthFailed(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        User? user = await authService.signUp(
            email: event.email, password: event.password);
        if (user != null) {
          emit(Authenticated(user));
        }
      } catch (e) {
        emit(AuthFailed(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<GoogleSignInRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        User? user = await authService.signInWithGoogle();
        if (user != null) {
          emit(Authenticated(user));
        }
      } catch (e) {
        emit(AuthFailed(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(AuthLoading());
      await authService.signOut();
      emit(UnAuthenticated());
    });
  }
}
