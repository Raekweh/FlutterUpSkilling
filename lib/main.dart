import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upskillingproject/Map/geolocatorService.dart';
import 'package:upskillingproject/Screens/MapMenu.dart';

// void main() {
//   loginMenu login = loginMenu();
//   runApp(login);
// }

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  final locatorService = GeoLocatorService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => locatorService.getLocation(),
      initialData: null,
      child: MaterialApp(
        title: 'Parking App',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: Search(),
      ),
    );
  }
}
