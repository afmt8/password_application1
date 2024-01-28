import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth.dart';
import 'package:flutter_application_1/page/ForgetPassword.dart';
import 'package:flutter_application_1/page/Home.dart';
import 'package:flutter_application_1/page/PasswordGenerator.dart';
import 'package:flutter_application_1/page/Save.dart';
import 'package:flutter_application_1/page/SignIn.dart';
import 'package:flutter_application_1/page/login.dart';
import 'package:flutter_application_1/page/signup.dart';
import 'firebase_options.dart';
//import 'dart:js';
import 'package:js/js.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //home: ForgetPassword(),
      routes: {
        '/': (context) => Auth(),
        'SignIn': (context) => signin(),
        'SignUp': (context) => signup(),
        'ForgetPassword': (context) => ForgetPassword(),
        'Home': (context) => HomeScreen(),
        'Save': (context) => Save(),
        'PasswordGenerator': (context) => PassG()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("First Application"),
      ),
      body: Center(
        child: Btn("Login"),
      ),
    );
  }
}

class Btn extends StatelessWidget {
//  const Btn({super.key});
  final String name;
  Btn(this.name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 50,
          width: 100,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.lightGreen[500],
          ),
          child: Center(
            child: Text(name),
          )
          //child: Text(name),

          ),
    );
  }
}
