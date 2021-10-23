import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  _SettingsMenuState createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
              onPressed: () {},
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
