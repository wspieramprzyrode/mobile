@JS('navigator.geolocation')
library jslocation;

import 'package:js/js.dart';

@JS('getCurrentPosition') //Geolocation API's getCurrentPosition
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
