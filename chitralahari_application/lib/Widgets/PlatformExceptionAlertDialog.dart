import 'package:chitralahari_application/Widgets/PlatformAlertDIalogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialogs {
  PlatformExceptionAlertDialog(
      {@required String title, @required PlatformException exception})
      : super(
            title: title,
            content: _message(exception),
            defaultActionText: "ok");

  static String _message(PlatformException exception) {
    return _errors[exception.code] ?? exception.message;
  }

  static Map<String, String> _errors = {
    'ERROR_WRONG_PASSWORD': 'The Pasword is Wrong...',
  };
}
