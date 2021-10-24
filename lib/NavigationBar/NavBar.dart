import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upskillingproject/Screens/MapMenu.dart';
import 'package:upskillingproject/Screens/PaymentMenu.dart';
import 'package:upskillingproject/Screens/SettingsMenu.dart';


class NavigationBar extends StatefulWidget {
  @override
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
  int currentIndex = 1;

  final screens = [
    PaymentMenu(),
    Search(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: screens[currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.payment),
          label: 'Payment',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.white,
        )
      ],
    ),
  );
}