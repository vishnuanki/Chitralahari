import 'package:chitralahari_application/Widgets/custom_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitButton extends CustomRaisedButton {
  SubmitButton({
    @required String text,
    @required VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          boarderRadius: 5.0,
          color: Colors.blue[900],
          onPressed: onPressed,
          height: 50,
        );
}
