import 'geolocation.dart';
import 'geolocation_stub.dart'
    if (dart.library.io) 'geolocation_mobile.dart'
    if (dart.library.js) 'geolocation_web.dart';

abstract class GeolocationService {
  /// Creates a new platform appropriate [GeolocationService].
  ///
  /// Creates an `GeolocationMobile` if `dart:io` is available and a `GeolocationWeb` if
  /// `dart:js` is available, otherwise it will throw an unsupported error.
  factory GeolocationService() => createGeolocationService();

  GpsLocation get currentLocation;

  Future<GpsLocation> getUserLocation();
}
