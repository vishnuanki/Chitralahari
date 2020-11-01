import 'package:chitralahari_application/Services/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({ @required this.auth});
  final AuthBase auth;
  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chitralahari..."),
        actions: [
          FlatButton(
              onPressed: _signOut,
              child: Text(
                "Sign Out",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
