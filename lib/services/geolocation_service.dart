import 'package:flutter/foundation.dart';
import 'package:location/location.dart';
import 'package:wspieramprzyrode/models/gps.dart';
import 'location_ext.dart';

class GeolocationService {
  // final Location location = Location();
  // GpsLocation _currentLocation;
  GpsLocation _currentLocation =
      GpsLocation(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

  GpsLocation get currentLocation => _currentLocation;

  Future<GpsLocation> getUserLocation() async {
    // try {
    //   final userLocation = await location.getLocation();
    //   _currentLocation = userLocation.toGpsLocation();
    // } on Exception catch (e) {
    //   debugPrint('Could not get location: ${e.toString()}');
    // }

    return _currentLocation;
  }
}
