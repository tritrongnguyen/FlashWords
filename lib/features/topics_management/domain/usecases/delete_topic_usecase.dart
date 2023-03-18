import '../repositories/topic_repository.dart';

class DeleteTopicUseCase {
  final TopicRepository topicRepository;

  const DeleteTopicUseCase({required this.topicRepository});

  Future<bool> call({required String id}) {
    return topicRepository.deleteTopic(id: id);
  }
}
