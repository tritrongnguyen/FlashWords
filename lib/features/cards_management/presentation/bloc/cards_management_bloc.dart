import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cards_management_event.dart';
part 'cards_management_state.dart';

class CardsManagementBloc extends Bloc<CardsManagementEvent, CardsManagementState> {
  CardsManagementBloc() : super(CardsManagementInitial()) {
    on<CardsManagementEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
