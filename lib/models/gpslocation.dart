import 'package:flutter/foundation.dart';

@immutable
class GpsLocation {
  /// Latitude in degrees
  final double latitude;

  /// Longitude, in degrees
  final double longitude;

  /// Estimated horizontal accuracy of this location, radial, in meters
  ///
  /// Always 0 on Web
  final double accuracy;

  /// In meters above the WGS 84 reference ellipsoid
  ///
  /// Always 0 on Web
  final double altitude;

  /// In meters/second
  ///
  /// Always 0 on Web
  final double speed;

  /// In meters/second
  ///
  /// Always 0 on Web and iOS
  final double speedAccuracy;

  /// Heading is the horizontal direction of travel of this device, in degrees
  ///
  /// Always 0 on Web
  final double heading;

  /// timestamp of the LocationData
  final double time;

  const GpsLocation(
    this.latitude,
    this.longitude, {
    this.accuracy = 0.0,
    this.altitude = 0.0,
    this.speed = 0.0,
    this.speedAccuracy = 0.0,
    this.heading = 0.0,
    this.time = 0.0,
  });
}
