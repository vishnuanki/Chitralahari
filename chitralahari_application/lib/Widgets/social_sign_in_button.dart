import 'package:chitralahari_application/Widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    String text,
    Color color,
    Color textColor,
    double boarderRadius: 2.0,
    VoidCallback onPressed,
  })  : assert(assetName != null),
        assert(text != null),
        super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(assetName),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15.0,
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Image.asset('images/google-logo.png'),
                ),
              ],
            ),
            color: color,
            boarderRadius: boarderRadius,
            onPressed: onPressed);
}
