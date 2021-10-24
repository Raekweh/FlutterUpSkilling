import 'package:ParkingApp/Register/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsMenuState createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<Settings> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: OutlineButton(
              onPressed: () {},
              child: Text(
                'Topup',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: OutlineButton(
              onPressed: () {},
              child: Text(
                'Payment History',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: OutlineButton(
              onPressed: () {},
              child: Text(
                'Account',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: OutlineButton(
              onPressed: () async{
                await _auth.signOut();
              },
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          )
        ],
      )),
    ));
  }
}
