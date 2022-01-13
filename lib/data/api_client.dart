import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/data/local_db/entities/posts_entity.dart';
import 'package:firebase_practice/ui/login/login_screen.dart';
import 'package:firebase_practice/utils/functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ApiClient {
  ///login API call Firestore
  Future<dynamic> loginUser({required BuildContext context,
    required String email,
    required String password}) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Utils.showSnackbar(
          context: context, mesg: (e as FirebaseAuthException).message!);
      return (e as FirebaseAuthException).message!;
    }
  }

  Future<dynamic> getUserData() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      // print(snapshot.get('imageUrl'));
      return snapshot;
    } catch (e) {
      return (e as FirebaseException).message;
    }
  }

  Future<dynamic> getPostsData() async {
    try {
      CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('posts');

      // Get specific user posts from collection reference
      /// QuerySnapshot querySnapshot = await _collectionRef
      ///     .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      ///     .get();

      QuerySnapshot querySnapshot = await _collectionRef.get();
      return querySnapshot;
    } catch (e) {
      return (e as FirebaseException).message;
    }
  }

  ///login API call Firebase Auth
  // Future<String> loginUser(
  //     {required BuildContext context,
  //     required String email,
  //     required String password}) async {
  //   try {
  //      await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);
  //
  //     return Utils.showSnackbar(
  //         context: context, mesg: 'Logged in Successfully');
  //   } catch (e) {
  //     return Utils.showSnackbar(context: context, mesg: (e as FirebaseAuthException).message!);
  //   }
  // }

  ///register API call using Firebase Auth
  Future<dynamic> registerUser({required BuildContext context,
    required String email,
    required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Utils.showSnackbar(context: context, mesg: 'Registered Successfully');
      Utils.nextScreen(
          context: context, screenRouteName: LoginScreen.routeName);
    } catch (e) {
      Utils.showSnackbar(
          context: context, mesg: (e as FirebaseAuthException).message!);
    }
  }

  ///forgot APi call Using FirebaseAuth
  Future<dynamic> sendCode(
      {required BuildContext context, required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Utils.nextScreen(
          context: context, screenRouteName: LoginScreen.routeName);
      Utils.showSnackbar(context: context, mesg: 'Code sent to Email');
      return;
    } catch (e) {
      Utils.showSnackbar(
          context: context, mesg: (e as FirebaseAuthException).message!);
      return;
    }
  }

  ///save User Data against User Registeration Id using Firestore
  Future<dynamic> saveUserData({
    required BuildContext context,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String confirmPassword,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'imageUrl': null,
      });
      Utils.showSnackbar(context: context, mesg: 'Saved User Data');
      Utils.nextScreen(
          context: context, screenRouteName: LoginScreen.routeName);
    } catch (e) {
      Utils.showSnackbar(
          context: context, mesg: (e as FirebaseAuthException).message!);
    }
  }

  ///Update data
  Future<dynamic> updateData({required String firstName,
    required String lastName,
    required String? imageUrl}) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'firstName': firstName,
        'lastName': lastName,
        'imageUrl': imageUrl
      });
    } catch (e) {
      return (e as FirebaseException).message;
    }
  }

  /// upload image to Firebase Storage
  Future<dynamic> uplaodImage(
      {required BuildContext context, required File imageFile}) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref =
      storage.ref('/user/profileImage/${basename(imageFile.path)}');
      //upload image
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;

      // Waits till the file is uploaded then stores the download url
      String url = await taskSnapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      return (e as FirebaseException).message.toString();
    }
  }

  Future<String> uploadPostImage(
      {required BuildContext context, required File postfile}) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref('/user/posts/${basename(postfile.path)}');
      //upload image
      UploadTask uploadTask = ref.putFile(postfile);
      TaskSnapshot taskSnapshot = await uploadTask;

      // Waits till the file is uploaded then stores the download url
      String url = await taskSnapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      return (e as FirebaseException).message.toString();
    }
  }

  Future<dynamic> savePostsData({
    required BuildContext context,
    required String title,
    required String desc,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('posts').doc().set({
        'userId': FirebaseAuth.instance.currentUser!.uid,
        'title': title,
        'desc': desc,
        'imageUrl': null,
      });
      Utils.showSnackbar(context: context, mesg: 'Post Added');
      // Utils.nextScreen(context: context, screenRouteName: HomeScreen.routeName);
    } catch (e) {
      Utils.showSnackbar(context: context, mesg: 'Failed to Add Post');
    }
  }
}
