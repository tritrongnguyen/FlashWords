import 'package:equatable/equatable.dart';

class Topic extends Equatable {
  final String id;
  final String title;
  final String colorValue;
  final int views;

  const Topic({
    required this.id,
    required this.title,
    required this.colorValue,
    required this.views,
  });

  @override
  List<Object?> get props => [id, title, colorValue];
}
