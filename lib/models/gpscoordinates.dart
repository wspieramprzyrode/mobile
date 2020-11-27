import 'package:flutter/foundation.dart';

@immutable
class GpsCoordinates {
  /// Latitude in degrees
  final double latitude;

  /// Longitude, in degrees
  final double longitude;

  const GpsCoordinates(this.latitude, this.longitude);
}
