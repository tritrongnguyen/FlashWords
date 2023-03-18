import 'package:equatable/equatable.dart';

import '../entities/topic.dart';

abstract class TopicRepository extends Equatable {
  Future<Topic> getSingleTopicById({required String id});

  Future<List<Topic>> getAllTopicsOfUser({required String uid});

  Future<bool> createTopic({required Topic newTopic});

  Future<bool> deleteTopic({required String id});

  Future<bool> updateTopic({required Topic updatedTopic});
}
