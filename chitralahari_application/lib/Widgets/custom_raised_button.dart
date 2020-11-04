import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double boarderRadius;
  final double height;
  final VoidCallback onPressed;

  CustomRaisedButton({
    this.child,
    this.color,
    this.boarderRadius: 2.0,
    this.height: 50.0,
    this.onPressed,
  }) : assert(boarderRadius != null);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: this.child,
        color: this.color,
        disabledColor: color,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(this.boarderRadius))),
        onPressed: this.onPressed,
      ),
    );
  }
}
