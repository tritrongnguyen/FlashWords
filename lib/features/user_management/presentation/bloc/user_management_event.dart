part of 'user_management_bloc.dart';

abstract class UserManagementEvent extends Equatable {
  const UserManagementEvent();

  @override
  List<Object> get props => [];
}

class GetUserByUidRequested extends UserManagementEvent {
  final String uid;

  const GetUserByUidRequested({required this.uid});
}

class UpdateUserRequested extends UserManagementEvent {
  final FirebaseUser firebaseUser;

  const UpdateUserRequested({required this.firebaseUser});
}
