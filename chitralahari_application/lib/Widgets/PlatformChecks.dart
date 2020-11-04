import 'dart:io';

import 'package:flutter/material.dart';

abstract class PlatformChecks extends StatelessWidget {
  Widget buildCupertinoWidgte(BuildContext context);
  Widget buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return buildCupertinoWidgte(context);
    } else {
      return buildMaterialWidget(context);
    }
  }
}
