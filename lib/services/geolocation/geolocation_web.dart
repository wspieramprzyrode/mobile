import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:js/js.dart';
import 'package:wspieramprzyrode/models/gpslocation.dart';
import 'package:wspieramprzyrode/services/geolocation/geolocation_service.dart';

import 'jslocation.dart';

class GeolocationWeb with GeolocationService {
  GpsLocation _currentLocation;

  @override
  GpsLocation get currentLocation => _currentLocation;

  @override
  Future<GpsLocation> getUserLocation() async {
    final Completer<GpsLocation> completer = Completer();
    try {
      getCurrentPosition(allowInterop((pos) {
        _currentLocation =
            GpsLocation(pos.coords.latitude, pos.coords.longitude);
        completer.complete(_currentLocation);
      }));
    } on Exception catch (e, st) {
      debugPrint('Could not get location: ${e.toString()}');
      completer.completeError(e, st);
    }

    return completer.future;
  }
}
