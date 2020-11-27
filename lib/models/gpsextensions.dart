import 'package:wspieramprzyrode/models/gpscoordinates.dart';
import 'package:wspieramprzyrode/models/gpslocation.dart';

extension GpsLocationExt on GpsLocation {
  GpsCoordinates getGpsCoordinates() {
    return GpsCoordinates(latitude, longitude);
  }
}
