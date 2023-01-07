import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../services/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService firebaseAuthService;

  LoginBloc({required this.firebaseAuthService}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      // emit(LoginLoading());
      try {
        await firebaseAuthService.signIn(email: '', password: '');
      } catch (e) {
        // emit(LoginFailed(e.toString()));
      }
    });
  }
}
