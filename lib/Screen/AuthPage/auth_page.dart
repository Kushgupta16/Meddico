import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meddico/Screen/LoginPage/LoginPage.dart';
import 'package:meddico/Screen/bottomnav.dart';
import 'package:meddico/main.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Bottomnav();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
