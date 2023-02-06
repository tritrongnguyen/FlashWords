import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../user_management/data/datasources/remote/user_remote_datasource.dart';
import '../../../../user_management/data/models/firebase_user_model.dart';
import '../../../../user_management/domain/entities/firebase_user.dart';
import 'firebase_auth_remote_datasource.dart';

class FirebaseAuthRemoteDataSourceImpl implements FirebaseAuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final UserRemoteDataSource userRemoteDataSource;

  FirebaseAuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.userRemoteDataSource,
  });

  User? get currentUser => firebaseAuth.currentUser;

  @override
  Future<bool> isSignIn() async {
    return currentUser!.uid != null;
  }

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential? userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      UserCredential? userCredential =
          await firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null &&
          userCredential.additionalUserInfo!.isNewUser) {
        String uid = userCredential.user!.uid;
        String? email = userCredential.user!.email;
        String? userName = userCredential.user!.displayName;

        FirebaseUserModel newUser = FirebaseUserModel(
          id: uid,
          userName: userName!,
          email: email!,
          type: Type.google,
        );

        userRemoteDataSource.addNewUser(firebaseUser: newUser);
      }

      return userCredential.user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<User?> signUpWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential? userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;
        String? email = userCredential.user!.email;

        FirebaseUserModel newUser = FirebaseUserModel(
          id: uid,
          userName: userName,
          email: email!,
          type: Type.emailAndPassword,
        );

        userRemoteDataSource.addNewUser(firebaseUser: newUser);
      }

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }
}
