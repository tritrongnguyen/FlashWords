import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/firebase_user.dart';
import '../../domain/usecases/get_single_user_by_uid_usecase.dart';

part 'user_management_event.dart';
part 'user_management_state.dart';

class UserManagementBloc
    extends Bloc<UserManagementEvent, UserManagementState> {
  final GetSingleUserByUidUseCase getSingleUserByUidUseCase;

  UserManagementBloc({required this.getSingleUserByUidUseCase})
      : super(UserManagementInitial()) {
    on<GetUserByUidRequested>((event, emit) async {
      emit(UserManagementLoading());
      try {
        FirebaseUser user =
            await getSingleUserByUidUseCase.call(uid: event.uid);
        emit(UserManagementSucceeded(user: user));
      } catch (e) {
        emit(UserManagementFailed(err: e.toString()));
      }
    });
  }
}
