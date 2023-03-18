import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/topic.dart';
import '../../domain/usecases/get_all_topics_usecase.dart';

part 'topics_management_event.dart';
part 'topics_management_state.dart';

class TopicsManagementBloc
    extends Bloc<TopicsManagementEvent, TopicsManagementState> {
  final GetAllTopicsOfUserUseCase getAllTopicsOfUserUseCase;

  TopicsManagementBloc({required this.getAllTopicsOfUserUseCase})
      : super(TopicsManagementInitial()) {
    on<TopicsGetAllEvent>((event, emit) async {
      emit(TopicsManagementLoading());

      try {
        List<Topic> topics =
            await getAllTopicsOfUserUseCase.call(uid: event.uid);
        if (topics.isNotEmpty) {
          emit(TopicsGetAllSucceed(topics: topics));
        } else {
          emit(const TopicsManagementFailed(err: "Doesn't have any data"));
        }
      } catch (e) {
        emit(TopicsManagementFailed(err: e.toString()));
        throw Exception(e.toString());
      }
    });
  }
}
