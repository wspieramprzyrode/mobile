import 'package:flutter/foundation.dart';
import 'package:location/location.dart';
import 'package:wspieramprzyrode/models/gpslocation.dart';
import 'package:wspieramprzyrode/services/geolocation/geolocation_service.dart';
import 'package:wspieramprzyrode/services/geolocation/location_ext.dart';

class GeolocationMobile with GeolocationService {
  final Location location = Location();
  GpsLocation _currentLocation;

  @override
  GpsLocation get currentLocation => _currentLocation;

  @override
  Future<GpsLocation> getUserLocation() async {
    try {
      final userLocation = await location.getLocation();
      _currentLocation = userLocation.toGpsLocation();
    } on Exception catch (e) {
      debugPrint('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }
}
