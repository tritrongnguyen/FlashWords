import '../entities/topic.dart';
import '../repositories/topic_repository.dart';

class GetSingleTopicByIdUseCase {
  final TopicRepository topicRepository;

  const GetSingleTopicByIdUseCase({required this.topicRepository});

  Future<Topic> call({required String id}) {
    return topicRepository.getSingleTopicById(id: id);
  }
}
