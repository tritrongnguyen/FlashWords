import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/usecases/auth_usecases/sign_in_with_email_and_password_usecase.dart';
import '../../../domain/usecases/auth_usecases/sign_in_with_google_usecase.dart';
import '../../../domain/usecases/auth_usecases/sign_out_usecase.dart';
import '../../../domain/usecases/auth_usecases/sign_up_with_email_and_password.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final SignOutUseCase signOutUseCase;
  final SignUpWithEmailAndPasswordUseCase signUpWithEmailAndPasswordUseCase;

  AuthBloc({
    required this.signInWithEmailAndPasswordUseCase,
    required this.signInWithGoogleUseCase,
    required this.signOutUseCase,
    required this.signUpWithEmailAndPasswordUseCase,
  }) : super(
          UnAuthenticated(),
        ) {
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        User? user = await signInWithEmailAndPasswordUseCase.call(
            email: event.email, password: event.password);
        if (user != null) {
          emit(Authenticated(uid: user.uid));
        }
      } catch (e) {
        emit(AuthFailed(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(AuthLoading());
      await signOutUseCase.call();
      emit(UnAuthenticated());
    });

    on<GoogleSignInRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        User? user = await signInWithGoogleUseCase.call();
        if (user != null) {
          emit(Authenticated(uid: user.uid));
        }
      } catch (e) {
        emit(AuthFailed(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        if (event.password.trim() == event.confirmPassword.trim()) {
          User? user = await signUpWithEmailAndPasswordUseCase.call(
            userName: event.userName,
            email: event.email,
            password: event.password,
          );
          if (user != null) {
            emit(Authenticated(uid: user.uid));
            emit(UnAuthenticated());
          }
        } else {
          emit(const AuthFailed("Confirm password doesn't match!"));
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthFailed(e.toString()));
        emit(UnAuthenticated());
      }
    });
  }
}
