import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:upskillingproject/Map/services/geolocatorService.dart';
import 'package:upskillingproject/Map/services/placeservice.dart';
import 'package:upskillingproject/Screens/MapMenu.dart';
import 'Map/models/place.dart';
import 'NavigationBar/NavBar.dart';
import 'Screens/SettingsMenu.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final placeService = PlaceService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(
            create: (context) => locatorService.getLocation(),
            initialData: null),
        ProxyProvider<Position?, Future<List<Place>>?>(
          update: (context, position, places) {
            return (position != null)
                ? placeService.getPlaces(position.latitude, position.longitude)
                : null;
          },
        )
      ],
      child: MaterialApp(
        title: 'Parking App',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: SettingsMenu(),
      ),
    );
  }
}
