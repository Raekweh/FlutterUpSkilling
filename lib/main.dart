import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upskillingproject/Map/services/geolocatorService.dart';
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
      initialData: null,
      create: (context) => locatorService.getLocation(),
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
