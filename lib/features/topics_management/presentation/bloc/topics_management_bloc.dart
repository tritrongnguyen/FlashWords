import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'topics_management_event.dart';
part 'topics_management_state.dart';

class TopicsManagementBloc extends Bloc<TopicsManagementEvent, TopicsManagementState> {
  TopicsManagementBloc() : super(TopicsManagementInitial()) {
    on<TopicsManagementEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
