import '../models/gpscoordinates.dart';
import '../services/geolocation/gpslocation.dart';

extension GpsLocationExt on GpsLocation {
  GpsCoordinates getGpsCoordinates() {
    return GpsCoordinates(latitude, longitude);
  }
}
