import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zetaton_wallpaper/features/authentication/presentation/screens/login_screen.dart';
import 'package:zetaton_wallpaper/features/skeleton/presentation/skeleton.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Skeleton();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
