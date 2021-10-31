import 'package:ParkingApp/Map/data/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlaceService {
  final key = 'AIzaSyDUbtDRWEoLx2NeEllbBg2Q24OXB8e7C1g';

  Future<List<Place>> getPlaces(double lat, double lng) async {
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=parking&key=$key&radius=1500'));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
