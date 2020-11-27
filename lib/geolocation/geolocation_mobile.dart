import 'package:flutter/foundation.dart';
import 'package:location/location.dart';

import 'geolocation.dart';

/// Create a [GeolocationMobile] service.
///
/// Used from conditional imports, matches the definition in `geolocation_stub.dart`.
GeolocationService createGeolocationService() => GeolocationMobile();

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
