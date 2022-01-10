// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:todo_app/models/todo.dart';
import 'package:memebytes/models/user.dart';

class Database {
  // final Firestore _firestore = Firestore.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(_doc);
    } catch (e) {
      // print(e);
      rethrow;
    }
  }
}
