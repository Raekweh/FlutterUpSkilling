import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:ParkingApp/Map/services/geolocatorService.dart';
import 'package:ParkingApp/Map/services/placeservice.dart';
import 'Map/models/place.dart';
import 'NavigationBar/NavBar.dart';

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
        home: NavigationBar(),
      ),
    );
  }
}