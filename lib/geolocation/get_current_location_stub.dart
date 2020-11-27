import 'gpslocation.dart';

Future<GpsLocation> getCurrentLocation() =>
    throw UnsupportedError("Unsupported on platforms other than web.");
