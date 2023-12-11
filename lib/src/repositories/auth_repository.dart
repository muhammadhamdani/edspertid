import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth fireAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Future<User?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //
  //     if (googleUser == null) return null;
  //
  //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     final UserCredential authResult = await fireAuth.signInWithCredential(credential);
  //
  //     return authResult.user;
  //   } catch(e){
  //     print('Google Sign-In Error: $e');
  //     return null;
  //   }
  // }

  // Future<void> signOut() async {
  //   await fireAuth.signOut();
  //   await googleSignIn.signOut();
  // }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User?> getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    return user;
  }

  Future<void> signOut() async {
    try {
      await fireAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }


}
