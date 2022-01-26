// ignore_for_file: avoid_print, file_names

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memebytes/connectivity/storage.dart';
import 'package:memebytes/models/user_model.dart' as model;

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //signup user
  Future<String> signup({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String result = "An error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        // register user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(credential.user!.email.toString());

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        // add user to database

        model.User user = model.User(
          username: username,
          uid: credential.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          photoUrl: photoUrl,
        );

        _firestore.collection('users').doc(credential.user!.uid).set(
              user.toJson(),
            );
        result = 'success!';
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        result = "The email is badly formatted.";
      } else if (error.code == 'weak-password') {
        result = "Password should be at least 6 characters.";
      }
    } catch (error) {
      result = error.toString();
    }
    return result;
  }

  // login user in
  Future<String> login({
    required String email,
    required String password,
  }) async {
    String result = "An error occurred.";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "success!";
      } else {
        result = "Please enter all the fields.";
      }
    } on FirebaseException catch (error) {
      if (error.code == 'user-not-found') {
        result = "There is no user under that account";
      } else if (error.code == 'wrong-password') {
        result = "Incorrect password";
      }
    } catch (error) {
      result = error.toString();
    }
    return result;
  }
}
