import 'package:flutter/material.dart';

import '../Register/auth.dart';

class LoginMenu extends StatefulWidget {

  final Function toogleView;
  LoginMenu({required this.toogleView});

  @override
  LoginMenuState createState() => LoginMenuState();
}

class LoginMenuState extends State<LoginMenu> {
  final AuthService _authService = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign in'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toogleView();
            },
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text('Sign in', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              )
            ],
          ))),
    );
  }
}
