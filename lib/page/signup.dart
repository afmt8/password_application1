import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _EmailController = TextEditingController();
  final _PasswordController = TextEditingController();
  final _ConPasswordController = TextEditingController();

  Future SignUp() async {
    if (confirmation()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _EmailController.text.trim(),
          password: _PasswordController.text.trim());
      Navigator.of(context).pushNamed('/');
    }
  }

  bool confirmation() {
    if (_ConPasswordController.text.trim() == _PasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  //for display if we dont use them.
  void dispose() {
    _EmailController.dispose();
    _PasswordController.dispose();
    _ConPasswordController.dispose();
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
          Text("Sign Up",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          Text("Welcome!",
              style: TextStyle(
                fontSize: 12,
              )),

          //email
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
                    controller: _EmailController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter your Email"),
                  ),
                ),
              )),
          //confirm password
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
                    controller: _ConPasswordController,
                    obscureText: true, //hide password
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Password"),
                  ),
                ),
              )),

          //
          //Sign in button
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: SignUp,
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
        ],
      ),
    )));
  }
}
