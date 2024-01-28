import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/Menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _PasswordController = TextEditingController();

  //for display if we dont use them.
  void dispose() {
    _PasswordController.dispose();
  }

//write in Text filed
  void Generation() {
    _PasswordController.text = "Hello";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Center(
            child: Text("PGeneration"),
          ),
          backgroundColor: Colors.lightGreen[500],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                //image

                //title
                SizedBox(
                  height: 40,
                ),
                Text("Password Generation",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                Text("Allow you to generate strong a password",
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
                          controller: _PasswordController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: ""),
                        ),
                      ),
                    )),

                //Sign in button
                SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: Generation,
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
                        "Click for generation",
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
          ),
        ));
  }
}
