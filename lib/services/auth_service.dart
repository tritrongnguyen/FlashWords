import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flashwords/models/user.dart';
import 'package:flashwords/services/users_management_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final UserManagementService _userManagementService = UserManagementService();
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  User? get currentUser => _firebaseAuth.currentUser;

  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential? userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential? userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      UserCredential? userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null &&
          userCredential.additionalUserInfo!.isNewUser) {
        print(userCredential.user!.uid);
        // _userManagementService.addUser(
        //   user: UserModel(
        //     id: ,
        //     email: 'email',
        //     userName: "userName",
        //     type: Type.google,
        //   ),
        // );
      }

      return userCredential.user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
