// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, file_names, avoid_print, invalid_return_type_for_catch_error

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // User? get user => _firebaseUser.value;
  String? get user => _firebaseUser.value?.email;
  // User setUser(User user) => _firebaseUser.value = user;

  @override
  void onReady() {
    super.onReady();
    _firebaseUser.bindStream(_firebaseAuth.authStateChanges());
  }

  void createUser(String email, String password) async {
    try {
      await _googleSignIn.signOut();
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthExeption) {
      Get.snackbar(
        "Error Creating User",
        firebaseAuthExeption.toString(),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void login(String email, String password) async {
    try {
      await _googleSignIn.signOut();
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthExeption) {
      Get.snackbar(
        "Error Signing In",
        // firebaseAuthExeption.toString(),
        "Username or Password is incorrect.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
    }
  }

  void signOut() async {
    await _firebaseAuth.signOut();
  }

  void signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await _firebaseAuth
            .signInWithCredential(credential)
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      // print(e.toString());
    }
  }
}
