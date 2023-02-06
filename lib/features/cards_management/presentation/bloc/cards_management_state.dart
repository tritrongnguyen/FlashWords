part of 'cards_management_bloc.dart';

abstract class CardsManagementState extends Equatable {
  const CardsManagementState();  

  @override
  List<Object> get props => [];
}
class CardsManagementInitial extends CardsManagementState {}
