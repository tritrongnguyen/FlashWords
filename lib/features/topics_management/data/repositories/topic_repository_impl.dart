import '../../domain/entities/topic.dart';
import '../../domain/repositories/topic_repository.dart';
import '../datasources/remote_datasources/topics_datasources.dart';

class TopicRepositoryImpl implements TopicRepository {
  final TopicRemoteDataSources topicRemoteDataSources;

  const TopicRepositoryImpl({required this.topicRemoteDataSources});

  @override
  Future<bool> createTopic({required Topic newTopic}) {
    return topicRemoteDataSources.createTopic(newTopic: newTopic);
  }

  @override
  Future<bool> deleteTopic({required String id}) {
    return topicRemoteDataSources.deleteTopic(id: id);
  }

  @override
  Future<List<Topic>> getAllTopicsOfUser({required String uid}) {
    return topicRemoteDataSources.getAllTopicsOfUser(uid: uid);
  }

  @override
  Future<Topic> getSingleTopicById({required String id}) {
    return topicRemoteDataSources.getSingleTopicById(id: id);
  }

  @override
  Future<bool> updateTopic({required Topic updatedTopic}) {
    return topicRemoteDataSources.updateTopic(updatedTopic: updatedTopic);
  }

  @override
  List<Object?> get props => [];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
