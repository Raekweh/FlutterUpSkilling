import 'package:ParkingApp/register/auth.dart';
import 'package:ParkingApp/register/models/app_user.dart';
import 'package:ParkingApp/register/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:ParkingApp/Map/services/geolocatorService.dart';
import 'package:ParkingApp/Map/services/placeservice.dart';
import 'Map/models/place.dart';
import 'navigation_bar/nav_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(myApp());
}

class myApp extends StatelessWidget {

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
                  return logIn();
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


class logIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return StreamProvider<AppUser?>.value(
      value: AuthService().user,
      initialData: null,
      child:const MaterialApp(
        home:Wrapper(),
      )
    );

  }
}

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