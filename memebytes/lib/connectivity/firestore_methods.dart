import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:memebytes/connectivity/storage.dart';
import 'package:memebytes/models/post.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // upload post
  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String result = "An error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v1();
      Post post = Post(
          description: description,
          uid: uid,
          postId: postId,
          username: username,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: profImage,
          likes: []);

      _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );
      result == "success!";
      return result;
    } catch (error) {
      result == error.toString();
      return result;
    }
  }
}
