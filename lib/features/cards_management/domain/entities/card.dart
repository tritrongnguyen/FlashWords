import 'package:equatable/equatable.dart';

import '../../../topics_management/domain/entities/topic.dart';

class Card extends Equatable {
  final String id;
  final String word;
  final String meaning;
  final String example;
  final String color;
  final String? imgUrl;
  final List<Topic> topics;

  const Card({
    required this.id,
    required this.word,
    required this.meaning,
    required this.example,
    required this.color,
    this.imgUrl,
    required this.topics,
  });

  @override
  List<Object?> get props => [];
}
