import 'dart:async';

import 'geolocation.dart';
import 'get_current_location_stub.dart'
    if (dart.library.js) 'get_current_location_web.dart';

/// Create a [GeolocationWeb] service.
///
/// Used from conditional imports, matches the definition in `geolocation_stub.dart`.
GeolocationService createGeolocationService() => GeolocationWeb();

class GeolocationWeb with GeolocationService {
  GpsLocation _currentLocation;

  @override
  GpsLocation get currentLocation => _currentLocation;

  @override
  Future<GpsLocation> getUserLocation() async =>
      _currentLocation = await getCurrentLocation();
}
