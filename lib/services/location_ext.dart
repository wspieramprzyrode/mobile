import 'package:location/location.dart';
import 'package:wspieramprzyrode/models/gps.dart';

extension LocationDateExt on LocationData {
  GpsLocation toGpsLocation() {
    return GpsLocation(
      latitude,
      longitude,
      accuracy,
      altitude,
      speed,
      speedAccuracy,
      heading,
      time,
    );
  }
}
