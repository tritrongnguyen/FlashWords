part of 'user_management_bloc.dart';

abstract class UserManagementState extends Equatable {
  const UserManagementState();

  @override
  List<Object> get props => [];
}

class UserManagementInitial extends UserManagementState {}

class UserManagementLoading extends UserManagementState {
  @override
  List<Object> get props => [];
}

class UserManagementSucceeded extends UserManagementState {
  final FirebaseUser user;

  const UserManagementSucceeded({required this.user});

  @override
  List<Object> get props => [];
}

class UserManagementFailed extends UserManagementState {
  final String err;

  const UserManagementFailed({required this.err});

  @override
  List<Object> get props => [];
}
