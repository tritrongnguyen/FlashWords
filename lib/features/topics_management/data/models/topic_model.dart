import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/topic.dart';

class TopicModel extends Topic {
  const TopicModel({
    required String id,
    required String title,
    required String colorValue,
    required int views,
  }) : super(
          id: id,
          colorValue: colorValue,
          title: title,
          views: views,
        );

  factory TopicModel.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();

    return TopicModel(
      id: data?['topicId'],
      title: data?['title'],
      colorValue: data?['colorValue'],
      views: data?['views'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'colorValue': colorValue,
      'views': views,
    };
  }
}
