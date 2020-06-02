import 'package:geolocator/geolocator.dart';


class GeolocationService  {
  var _geolocator = Geolocator();
  Position _currentLocation;
  Position get currentLocation => _currentLocation;

  Future<Position> getUserLocation() async{
    try {
      var userLocation = await _geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.best);
      _currentLocation = userLocation;
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }
}
