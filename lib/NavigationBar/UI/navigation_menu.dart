import 'package:ParkingApp/Map/data/place.dart';
import 'package:ParkingApp/Map/data/geolocator_service.dart';
import 'package:ParkingApp/Map/data/place_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../BLoC/nav_bar.dart';

class NavigationMenu extends StatelessWidget {
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