import 'package:chitralahari_application/Widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    @required String text,
    Color color,
    Color textColor,
    double boarderRadius,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 15.0,
              ),
            ),
            color: color,
            onPressed: onPressed);
}
