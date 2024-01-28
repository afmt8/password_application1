import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/Home.dart';
import 'package:flutter_application_1/page/PasswordGenerator.dart';
import 'package:flutter_application_1/page/Save.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        UserAccountsDrawerHeader(
          accountName: Text("user"),
          accountEmail: Text(user.email!),
          decoration: BoxDecoration(color: Colors.purple),
        ),
        // Decoration:BoxDecoration(
        //   color: Colors.red
        // ),

        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PassG()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.save),
          title: Text("My Passwords"),
          onTap: () {
            // Navigator.of(context).pushNamed('SignIn');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Save()),
            );
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Sign Out"),
          onTap: () => FirebaseAuth.instance.signOut(),
        ),
      ]),
    );
  }
}
