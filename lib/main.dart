import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:ParkingApp/Map/services/geolocatorService.dart';
import 'package:ParkingApp/Map/services/placeservice.dart';
import 'Map/models/place.dart';
import 'NavigationBar/NavBar.dart';
import 'package:ParkingApp/Register_Login/Authenticate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(logIn());
}

class logIn extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future:_fbApp,
        builder: (context, snapshot)
        {
          if(snapshot.hasError)
            {
              print('YOu have an error ${snapshot.error.toString()}');
              return Text('Something went wrong');
            }
          else if(snapshot.hasData)
            {
              print('Your database works');
              return Authenticate();
            }
          else
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        },
      )
    );
  }
}


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