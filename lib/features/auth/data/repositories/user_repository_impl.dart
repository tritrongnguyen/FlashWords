import '../../domain/entities/firebase_user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote/user_remote_datasource.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<bool> addNewUser({required FirebaseUser firebaseUser}) {
    return userRemoteDataSource.addNewUser(firebaseUser: firebaseUser);
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
