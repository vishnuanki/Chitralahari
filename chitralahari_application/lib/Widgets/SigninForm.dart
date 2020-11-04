// import 'dart:io';

import 'package:chitralahari_application/Widgets/PlatformExceptionAlertDialog.dart';
import 'package:chitralahari_application/Widgets/SubmitButton.dart';
import 'package:chitralahari_application/Widgets/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:chitralahari_application/Services/Auth.dart';

enum EmailSigninType { signin, register }

class SigninForm extends StatefulWidget with EmailAndPasswordValidators {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  EmailSigninType _formType = EmailSigninType.signin;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  bool _submitted = false;
  bool _isLoading = false;

  void _submit() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    try {
      final auth = Provider.of<AuthBase>(context);
      if (_formType == EmailSigninType.signin) {
        await auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await auth.createInWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        exception: e,
        title: "Sign in Failed.",
      ).show(context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void diapose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleForm() {
    setState(() {
      _submitted = false;
      _formType = _formType == EmailSigninType.signin
          ? EmailSigninType.register
          : EmailSigninType.signin;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    final primaryText =
        _formType == EmailSigninType.signin ? "Sign in" : "Create an account";
    final secondaryText = _formType == EmailSigninType.signin
        ? "Need an account? Register"
        : "Have an account?Sign in";

    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) &&
        !_isLoading;

    return [
      _buildEmailTextField(),
      SizedBox(
        height: 10,
      ),
      _buildPasswordTextField(),
      SizedBox(
        height: 10,
      ),
      SubmitButton(
        text: primaryText,
        onPressed: submitEnabled ? _submit : null,
      ),
      SizedBox(
        height: 10,
      ),
      FlatButton(
        onPressed: !_isLoading ? _toggleForm : null,
        child: Text(secondaryText),
      )
    ];
  }

  TextField _buildEmailTextField() {
    bool emailValid = _submitted && !widget.emailValidator.isValid(_email);
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "test@gmail.com",
        errorText: emailValid ? widget.invalidEMailErrorText : null,
        enabled: _isLoading == false,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (email) => _updateState(),
    );
  }

  TextField _buildPasswordTextField() {
    bool passwordValid =
        _submitted && !widget.passwordValidator.isValid(_password);
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: "Password",
        errorText: passwordValid ? widget.invalidPasswordErrorText : null,
        enabled: _isLoading == false,
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: _submit,
      onChanged: (password) => _updateState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChildren(),
      ),
    );
  }

  _updateState() {
    setState(() {});
  }
}
