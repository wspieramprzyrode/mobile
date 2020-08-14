import 'package:wspieramprzyrode/models/gps.dart';

mixin GeolocationService {
  GpsLocation get currentLocation;
  Future<GpsLocation> getUserLocation();
}
