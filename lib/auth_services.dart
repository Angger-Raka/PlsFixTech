import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future signInAnonymos() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      User firebaseUser = result.user!;

      return firebaseUser;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<void> signOut() async {
    auth.signOut();
  }

  //make function for sign in with email and password with GetX
  static Future signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user!;

      return firebaseUser;
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return null;
    }
  }
}
