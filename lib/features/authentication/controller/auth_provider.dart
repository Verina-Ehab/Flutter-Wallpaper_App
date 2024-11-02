import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zetaton_wallpaper/features/authentication/data/firebase_services.dart';

class AuthenticationProvider extends ChangeNotifier {
  final FirebaseServices fb = FirebaseServicesImp();

  // Register with email/password
  Future<void> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String phoneNumber,
      required String name,
      required BuildContext context}) async {
    fb.registerWithEmailAndPassword(
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        name: name,
        context: context);
    notifyListeners();
  }

  // Login with email/password
  Future<void> logInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    fb.loginWithEmailAndPassword(email, password, context);
    notifyListeners();
  }

  // Sign out
  Future<void> logOut() async {
    fb.signOut();
    notifyListeners();
  }

  // Listen to authentication state changes
  void initState() {
    fb.user;
    notifyListeners();
  }

  Future<void> saveUserData(User user, String phoneNumber, String name) async {
    fb.saveUserData(name: name, phoneNumber: phoneNumber);
    notifyListeners();
  }

  // Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) async {
  //   return await _firestore.collection('users').doc(uid).get();
  // }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    _isLoading = false;
    notifyListeners();
  }


}
