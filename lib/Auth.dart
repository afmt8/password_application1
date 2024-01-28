import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/Home.dart';
import 'package:flutter_application_1/page/PasswordGenerator.dart';
import 'package:flutter_application_1/page/SignIn.dart';
import 'package:flutter_application_1/page/login.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PassG();
            } else {
              return signin();
            }
          }),
    );
  }
}
