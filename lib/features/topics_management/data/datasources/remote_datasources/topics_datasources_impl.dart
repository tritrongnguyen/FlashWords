import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/topic.dart';
import '../../models/topic_model.dart';
import 'topics_datasources.dart';

class TopicRemoteDataSourcesImpl implements TopicRemoteDataSources {
  final FirebaseFirestore firebaseFirestore;

  const TopicRemoteDataSourcesImpl({required this.firebaseFirestore});

  @override
  Future<bool> createTopic({required Topic newTopic}) async {
    // TODO: implement createTopic
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTopic({required String id}) async {
    // TODO: implement deleteTopic
    throw UnimplementedError();
  }

  @override
  Future<List<Topic>> getAllTopicsOfUser({required String uid}) async {
    try {
      final snapshots = await firebaseFirestore
          .collection('topics')
          .where('uid', isEqualTo: uid)
          .get();

      final allData =
          snapshots.docs.map((doc) => TopicModel.fromFirebase(doc)).toList();

      return allData;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Topic> getSingleTopicById({required String id}) async {
    // TODO: implement getSingleTopicById
    throw UnimplementedError();
  }

  @override
  Future<bool> updateTopic({required Topic updatedTopic}) async {
    // TODO: implement updateTopic
    throw UnimplementedError();
  }
}
