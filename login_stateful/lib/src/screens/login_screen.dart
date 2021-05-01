import 'package:flutter/material.dart';
import "../mixins/validate_mixin.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidateMixin {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              emailField(),
              passwordField(),
              SizedBox(height: 25),
              submitButton()
            ],
          )),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email Adress", hintText: "you@example.com"),
      validator: (String value) => validateEmail(value),
      onSaved: (String value) => email = value,
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(labelText: "Password", hintText: "Password"),
      validator: (String value) => validatePassword(value),
      onSaved: (String value) => password = value,
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
      child: Text("Submit!"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
        }
        // formKey.currentState.reset();
      },
    );
  }
}
