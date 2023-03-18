part of 'topics_management_bloc.dart';

abstract class TopicsManagementState extends Equatable {
  const TopicsManagementState();

  @override
  List<Object> get props => [];
}

class TopicsManagementInitial extends TopicsManagementState {}

class TopicsManagementLoading extends TopicsManagementState {}

class TopicsGetAllSucceed extends TopicsManagementState {
  final List<Topic> topics;

  const TopicsGetAllSucceed({required this.topics});
}

class TopicsManagementFailed extends TopicsManagementState {
  final String err;

  const TopicsManagementFailed({required this.err});
}
