import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future signInAnonymos() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User firebaseUser = result.user!;

      return firebaseUser;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  // static Stream<FirebaseUser> get firebaseUserStream =>
  //     _auth.onAuthStateChanged;
}
