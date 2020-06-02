import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:wspieramprzyrode/services/geolocation_service.dart';
class MapView extends StatefulWidget {
  const MapView({Key key}) : super(key: key);

  @override
  MapViewState createState() => new MapViewState();
}

class MapViewState extends State<MapView> {
  List<Marker> markers = [];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final geolocation = Provider.of<GeolocationService>(context);
    return FutureBuilder<Position>(
      future: geolocation.getUserLocation(),
      builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Flexible(
                child: FlutterMap(
              options: MapOptions(
                center: LatLng(snapshot.data.latitude, snapshot.data.longitude),
                zoom: 13.0,
                plugins: [],
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
              ],
            ))
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
            children = <Widget>[
              const SizedBox(
                child: const CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
        }

        return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children);
      },
    );
  }
}
