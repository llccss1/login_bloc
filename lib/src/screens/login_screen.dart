import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          Container(margin:EdgeInsets.only(top: 25.0)),
          summitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Adress',
        hintText: 'you@example.com',
      )
    );
  }

  Widget passwordField() {
    return TextField(
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'password',
      )
    );
  }

  Widget summitButton() {
    return RaisedButton(
      child:Text('Login'),
      color: Colors.blue,
      onPressed: () {},
    );
  }
}