import 'package:flutter/material.dart';

class loginMenu extends StatefulWidget {
  const loginMenu({Key? key}) : super(key: key);

  @override
  loginMenuState createState() => loginMenuState();
}

class loginMenuState extends State {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            //Text for Username
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Username',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            //Textfield for username
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            //Text for Password
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Password',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            //Text field for password
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text(
                  'LogIn',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                },
              ),
            ),
          ]))),
    );
  }
}
