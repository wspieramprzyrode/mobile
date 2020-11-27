@JS('navigator.geolocation')
library jslocation;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:js/js.dart';

import '../gpslocation.dart';

@JS('getCurrentPosition') // Geolocation API's getCurrentPosition
external void getCurrentPosition(Function(GeolocationPosition pos) success);

@JS()
@anonymous
class GeolocationCoordinates {
  external factory GeolocationCoordinates({
    double latitude,
    double longitude,
  });

  external double get latitude;

  external double get longitude;
}

@JS()
@anonymous
class GeolocationPosition {
  external factory GeolocationPosition({GeolocationCoordinates coords});

  external GeolocationCoordinates get coords;
}

Future<GpsLocation> getCurrentLocation() {
  final Completer<GpsLocation> completer = Completer();
  try {
    getCurrentPosition(allowInterop((pos) {
      completer.complete(
        GpsLocation(pos.coords.latitude, pos.coords.longitude),
      );
    }));
  } on Exception catch (e, st) {
    debugPrint('Could not get location: ${e.toString()}');
    completer.completeError(e, st);
  }

  return completer.future;
}
