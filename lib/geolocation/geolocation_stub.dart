import 'geolocation_service.dart';

/// Implemented in `geolocation_mobile.dart` and `geolocation_web.dart`
GeolocationService createGeolocationService() => throw UnsupportedError(
    "Cannot create Geolocation Service without packages dart:io or dart:js");
