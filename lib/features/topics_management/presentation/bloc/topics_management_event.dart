part of 'topics_management_bloc.dart';

abstract class TopicsManagementEvent extends Equatable {
  const TopicsManagementEvent();

  @override
  List<Object> get props => [];
}

class TopicsGetAllEvent extends TopicsManagementEvent {
  final String uid;

  const TopicsGetAllEvent({required this.uid});
}
