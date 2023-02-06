import '../../domain/entities/firebase_user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<bool> addNewUser({required FirebaseUser firebaseUser}) async {
    return userRemoteDataSource.addNewUser(firebaseUser: firebaseUser);
  }

  @override
  Future<FirebaseUser> getUserByUid({required String uid}) async {
    return userRemoteDataSource.getUserByUid(uid: uid);
  }

  @override
  List<Object?> get props => [];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
