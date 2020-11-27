import 'package:location/location.dart';

import '../gpslocation.dart';

extension LocationDataExt on LocationData {
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
