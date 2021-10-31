import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ParkingApp/Map/data/place.dart';
import 'package:ParkingApp/Map/BLoC/marker_service.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position?>(context);
    final placesProvider = Provider.of<Future<List<Place>>?>(context);
    final markerService = MarkerService();

    return FutureProvider(
      create: (context) => placesProvider,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Map'),
          centerTitle: true,
        ),
          body: (currentPosition != null)
              ? Consumer<List<Place>?>(
                  builder: (_, places, __) {
                    var markers = (places != null)
                        ? markerService.getMarkers(places)
                        : <Marker>[];
                    return (places != null)
                        ? Column(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height/1.25,
                                width: MediaQuery.of(context).size.width,
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                      target: LatLng(currentPosition.latitude,
                                          currentPosition.longitude),
                                      zoom: 14.0),
                                  zoomGesturesEnabled: true,
                                  markers: Set<Marker>.of(markers),
                                ),
                              )
                            ],
                          )
                        : Center(child: CircularProgressIndicator());
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
