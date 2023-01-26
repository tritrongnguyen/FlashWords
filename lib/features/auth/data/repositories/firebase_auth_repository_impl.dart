import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/firebase_auth_repository.dart';
import '../datasources/remote/firebase_auth_remote_datasource.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final FirebaseAuthRemoteDataSource firebaseAuthRemoteDataSource;

  FirebaseAuthRepositoryImpl({required this.firebaseAuthRemoteDataSource});

  @override
  Future<bool> isSignIn() async {
    return firebaseAuthRemoteDataSource.isSignIn();
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return firebaseAuthRemoteDataSource.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<User?> signInWithGoogle() async {
    return firebaseAuthRemoteDataSource.signInWithGoogle();
  }

  @override
  Future<void> signOut() async {
    return firebaseAuthRemoteDataSource.signOut();
  }

  @override
  Future<User?> signUpWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  }) async {
    return firebaseAuthRemoteDataSource.signUpWithEmailAndPassword(
        userName: userName, email: email, password: password);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
