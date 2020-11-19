import 'package:chitralahari_application/Services/Auth.dart';
import 'package:chitralahari_application/Widgets/PlatformAlertDIalogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
    final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    // ignore: await_only_futures
    final didRequestSignOut = await PlatformAlertDialogs(
      content: "Are you sue to Sign Out..",
      title: "Logout",
      defaultActionText: "ok",
      cancelActionText: "Cancel",
    ).show(context);
    // ignore: unrelated_type_equality_checks
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chitralahari..."),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: () => _confirmSignOut(context),
              child: Text(
                "Sign Out",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
