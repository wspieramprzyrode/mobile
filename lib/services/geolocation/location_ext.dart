import 'package:location/location.dart';
import 'package:wspieramprzyrode/models/gps.dart';

extension LocationDateExt on LocationData {
  GpsLocation toGpsLocation() {
    return GpsLocation(
      latitude,
      longitude,
      accuracy: accuracy,
      altitude: altitude,
      speed: speed,
      speedAccuracy: speedAccuracy,
      heading: heading,
      time: time,
    );
  }
}
