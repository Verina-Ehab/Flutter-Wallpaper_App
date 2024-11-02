import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/contants/firestore_keys.dart';
import '../../../core/helpers/snackbar.dart';

abstract class FirebaseServices {
  User? get user;
  Future<void> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String phoneNumber,
      required String name,
      required BuildContext context});

  Future<void> loginWithEmailAndPassword(
      String email, String password, BuildContext context);
  Future<void> saveUserData(
      {required String phoneNumber, required String name});
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid);

  Future<void> signOut();
}

class FirebaseServicesImp implements FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // User? _user;
  @override
  User? get user => _auth.currentUser;

  @override
  Future<void> saveUserData(
      {required String phoneNumber, required String name}) async {
    try {
      await _firestore.collection(USERS_COLLECTION).doc(user!.uid).set(
        {USER_ID: user!.uid, USER_NAME: name, USER_PHONE: user!.phoneNumber},
        SetOptions(merge: true),
      );
      log("User data saved to Firestore");
    } catch (e) {
      log("Error saving user data: $e");
    }
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) async {
    return await _firestore.collection(USERS_COLLECTION).doc(uid).get();
  }

  @override
  Future<void> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String phoneNumber,
      required String name,
      required BuildContext context}) async {
    try {
      // UserCredential result =
       await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // user = result.user!;
      saveUserData(name: name, phoneNumber: phoneNumber);
    } on FirebaseAuthException catch (e) {
      // Handle exceptions using SnackBar
      showErrorSnackBar(
          context: context, message: e.message ?? 'Authentication Error');
      log(e.message.toString());
    }
  }

  @override
  Future<void> loginWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      // UserCredential result = 
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // _user = result.user!;
    } on FirebaseAuthException catch (e) {
      showErrorSnackBar(
          context: context, message: e.message ?? 'Authentication Error');
      log(e.message.toString());
    } 
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
