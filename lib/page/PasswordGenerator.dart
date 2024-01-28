import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:flutter_application_1/page/Menu.dart';

class PassG extends StatelessWidget {
  const PassG({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Center(child: Text('Password Generator')),
          backgroundColor: Colors.purple,
        ),
        body: PasswordGenerator(),
        backgroundColor: Color((0xB3FFFFFF)),
      ),
    );
  }
}

class PasswordGenerator extends StatefulWidget {
  _PasswordGeneratorState createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  String generatedPassword = '';
  TextEditingController saveController = TextEditingController();
  List<String> savedPasswords = [];
  bool includeUppercase = true;
  bool includeNumbers = true;
  bool includeSymbols = true;
  int passwordLength = 12;

  void generatePassword() {
    const lowercaseCharset = 'abcdefghijklmnopqrstuvwxyz';
    const uppercaseCharset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numberCharset = '0123456789';
    const symbolCharset = '!@#\$%^&*()_-+=<>?/{}[]|';

    String charset = lowercaseCharset;

    if (includeUppercase) charset += uppercaseCharset;
    if (includeNumbers) charset += numberCharset;
    if (includeSymbols) charset += symbolCharset;

    final random = Random.secure();

    var password = List.generate(passwordLength, (index) {
      return charset[random.nextInt(charset.length)];
    });

    setState(() {
      generatedPassword = password.join();
    });
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: generatedPassword));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Password copied to clipboard'),
      ),
    );
  }

  void savePassword() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Password'),
          content: Column(
            children: [
              TextField(
                controller: saveController,
                decoration: InputDecoration(labelText: 'Enter a name'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  String passwordName = saveController.text;

                  savedPasswords.add('$passwordName: $generatedPassword');
                  print(
                      'Password Name: $passwordName, Password: $generatedPassword');
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  void showSavedPasswords() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text('Saved Passwords', style: TextStyle(color: Colors.white)),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: savedPasswords
                .map(
                  (password) => ListTile(
                    title: Text(
                      password,
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: password));
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text('Password copied to clipboard'),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Password Length: $passwordLength',
                  style: TextStyle(
                      color: Colors.black)), // Set the text color to black
              Slider(
                value: passwordLength.toDouble(),
                min: 4,
                max: 30,
                onChanged: (value) {
                  setState(() {
                    passwordLength = value.round();
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text('Include Uppercase Letters:',
                    style: TextStyle(color: Colors.black)),
              ),
              Switch(
                value: includeUppercase,
                onChanged: (value) {
                  setState(() {
                    includeUppercase = value;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text('Include Numbers:',
                    style: TextStyle(color: Colors.black)),
              ),
              Switch(
                value: includeNumbers,
                onChanged: (value) {
                  setState(() {
                    includeNumbers = value;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text('Include Symbols:',
                    style: TextStyle(color: Colors.black)),
              ),
              Switch(
                value: includeSymbols,
                onChanged: (value) {
                  setState(() {
                    includeSymbols = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
            onPressed: generatePassword,
            child: Text('Generate Password'),
          ),
          SizedBox(height: 20),
          Text(
            'Generated Password:',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(height: 10),
          SelectableText(
            generatedPassword,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                onPressed: copyToClipboard,
                child: Center(
                  child: Text('Copy to Clipboard'),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                onPressed: savePassword,
                child: Text('Save'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                onPressed: showSavedPasswords,
                child: Text('Show Saved Passwords'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
