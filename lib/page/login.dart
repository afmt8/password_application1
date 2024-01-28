//import 'dart:js';
import 'package:js/js.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login extends StatelessWidget {
  final _EmailController = TextEditingController();
  final _PasswordController = TextEditingController();

  Future SignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _EmailController.text.trim(),
        password: _PasswordController.text.trim());
  }

  void OpenForgetPassword() {
    //Navigator.of(context as BuildContext).pushReplacementNamed('SignUp');
    //Navigator.pushReplacementNamed('SignUp');
  }

  //for display if we dont use them.
  void dispose() {
    _EmailController.dispose();
    _PasswordController.dispose();
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
          Text("Sign in",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          Text("Welcome Back!",
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
          //password
          SizedBox(
            height: 10,
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
                    controller: _PasswordController,
                    obscureText: true, //hide password
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Password"),
                  ),
                ),
              )),
          //Sign in button
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: SignIn,
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
                  "Sign In",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Or",
            style: TextStyle(fontSize: 15),
          ),
          //Sign Up button
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            //onTap: OpenSignUp,
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
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),

          //Sign up
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Forget password? "),
              GestureDetector(
                onTap: OpenForgetPassword,
                child: Text(
                  "click here",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    )));
  }
}
