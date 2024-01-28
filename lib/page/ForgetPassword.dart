import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _EmailController = TextEditingController();

  Future RestPassword() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _EmailController.text.trim());
    GoHome();
  }

  void GoHome() {
    Navigator.of(context).pushReplacementNamed('/');
  }

  //for display if we dont use them.
  void dispose() {
    _EmailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          //image

          //title
          SizedBox(
            height: 40,
          ),
          Text("Forget Password",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          Text("reset your password now",
              style: TextStyle(
                fontSize: 12,
              )),
          //email
          SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(31, 51, 51, 51),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _EmailController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter your email"),
                  ),
                ),
              )),

          //Sign in button
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: RestPassword,
            child: Container(
              height: 50,
              width: 200,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.lightGreen[500],
              ),
              child: Center(
                child: Text(
                  "Reset password",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
