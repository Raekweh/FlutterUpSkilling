import 'package:flutter/material.dart';
import 'package:upskillingproject/src/search.dart';

// void main() {
//   loginMenu login = loginMenu();
//   runApp(login);
// }

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Parking App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Search(),
    );
  }
}