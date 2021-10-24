import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterMenu extends StatefulWidget {
  const RegisterMenu({Key? key}) : super(key: key);

  @override
  _RegisterMenuState createState() => _RegisterMenuState();
}

class _RegisterMenuState extends State<RegisterMenu> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Email',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Container(
              child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          )),
          Container(
            child: Text(
              'Password',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Container(
              child: TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          )),
          Container(
            margin: EdgeInsets.all(25),
            child: FlatButton(
              child: Text(
                'Register',
                style: TextStyle(fontSize: 20.0),
              ),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {

              },
            ),
          ),
        ],
      )),
    ));
  }
}
