import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/models/post_model.dart';
import 'package:instagram/resources/storage_method.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//    upload post on db method

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = "Some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1(); // creates unique id for every post
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
      );
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

//  store likes count on db method

  Future<String> likePost(
    String postId,
    String uid,
    List likes,
  ) async {
    String res = "Some error occurred";
    try {
      if (likes.contains(uid)) {
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}

// store comment on db method

Future<String> postComment(
  String postId,
  String text,
  String uid,
  String name,
  String profilePic,
) async {
  String res = "Some error occurred";
  try {
    if (text.isNotEmpty) {
      String commentId =
          const Uuid().v1(); // creates unique id for every comment
      _firestore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .set({
        'profilePic': profilePic,
        'name': name,
        'uid': uid,
        'text': text,
        'commentId': commentId,
        'datePublished': DateTime.now(),
      });
      res = 'success';
    } else {
      res = "Please enter text";
    }
  } catch (err) {
    res = err.toString();
  }
  return res;
}
