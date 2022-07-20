import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/resources/storage_method.dart';
// import 'package:instagram/models/user.dart'as model;
import 'package:instagram/models/user_model.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


   // get user details from database

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  // sign up method

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some erroe occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print(cred.user!.uid);

        // add profile photo to database

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        // add user to database

         model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          bio: bio,
          followers: [].toString(),
          following: [].toString(),
        );


 await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());
        // await _firestore.collection('users').doc(cred.user!.uid).set({
        //   user.toJson(),
          // 'username': username,
          // 'uid': cred.user!.uid,
          // 'photoUrl': photoUrl,
          // 'email': email,
          // 'bio': bio,
          // 'followers': [],
          // 'following': [],
        // });
        res = 'succes';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // login method

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error Occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
