import '../entities/topic.dart';
import '../repositories/topic_repository.dart';

class UpdateTopicUseCase {
  final TopicRepository topicRepository;

  const UpdateTopicUseCase({required this.topicRepository});

  Future<bool> call({required Topic updatedTopic}) {
    return topicRepository.updateTopic(updatedTopic: updatedTopic);
  }
}
