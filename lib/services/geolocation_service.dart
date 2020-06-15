import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationService {
  final Geolocator _geolocator = Geolocator();
  Position _currentLocation;

  Position get currentLocation => _currentLocation;

  Future<Position> getUserLocation() async {
    try {
      final userLocation = await _geolocator.getCurrentPosition();
      _currentLocation = userLocation;
    } on Exception catch (e) {
      debugPrint('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }
}
