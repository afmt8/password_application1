import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/Menu.dart';

class Save extends StatelessWidget {
  const Save({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My Passwords")),
        backgroundColor: Colors.purple,
      ),
      drawer: Menu(),
      body: Center(
        child: Text(
          "This page not ready",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Color((0xB3FFFFFF)),
    );
  }
}
