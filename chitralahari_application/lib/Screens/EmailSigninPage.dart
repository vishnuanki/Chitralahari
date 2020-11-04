import 'package:chitralahari_application/Widgets/SigninForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailSigninApge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In.."),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            child: SigninForm(
            ),
          ),
        ),
      ),
    );
  }
}
