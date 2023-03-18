import '../entities/topic.dart';
import '../repositories/topic_repository.dart';

class CreateTopicUseCase {
  final TopicRepository topicRepository;

  const CreateTopicUseCase({required this.topicRepository});

  Future<bool> call({required Topic newTopic}) {
    return topicRepository.createTopic(newTopic: newTopic);
  }
}
