import '../entities/topic.dart';
import '../repositories/topic_repository.dart';

class GetAllTopicsOfUserUseCase {
  final TopicRepository topicRepository;
  const GetAllTopicsOfUserUseCase({required this.topicRepository});

  Future<List<Topic>> call({required String uid}) {
    return topicRepository.getAllTopicsOfUser(uid: uid);
  }
}
