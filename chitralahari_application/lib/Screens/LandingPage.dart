import 'package:chitralahari_application/Screens/HomePage.dart';
import 'package:chitralahari_application/Screens/sign_in_page.dart';
import 'package:chitralahari_application/Services/Auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});

  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FUser>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          FUser fuser = snapshot.data;
          if (fuser == null) {
            // return SignInPage(
            //   auth: auth,
            // );
            return SignInPage(
              auth: auth,
            );
          }
          // return HomePage(
          //   auth: auth,
          // );
          return HomePage(
            auth: auth,
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

