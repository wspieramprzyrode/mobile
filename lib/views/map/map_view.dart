import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:wspieramprzyrode/datamodels/inventory_object.dart';
import 'package:wspieramprzyrode/services/api/inventory_service.dart';
import 'package:wspieramprzyrode/services/geolocation_service.dart';

class MapView extends StatefulWidget {
  const MapView({Key key}) : super(key: key);

  @override
  MapViewState createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final geolocation = Provider.of<GeolocationService>(context);
    final objects = Provider.of<InventoryService>(context);

    return FutureBuilder<Position>(
        future: geolocation.getUserLocation(),
        builder: (context, userLocation) {
          return FutureBuilder<List<InventoryObject>>(
            future: objects.getObjects(),
            builder: (context, markers) {
              return _mapWidget(context, userLocation, markers);
            },
          );
        });
  }
}

Widget _mapWidget(BuildContext context, AsyncSnapshot<Position> snapshot,
    AsyncSnapshot<List<InventoryObject>> markers) {
  List<Widget> children;
  if (snapshot.connectionState == ConnectionState.done) {
    if (snapshot.hasData && markers.hasData) {
      children = _dataWidget(snapshot, _prepareMarkers(markers.data));
    } else if (snapshot.hasError) {
      children = _errorWidget(snapshot.error);
    } else if (markers.hasError) {
      children = _errorWidget(markers.error);
    } else {
      children = _progessWidget();
    }
  } else {
    children = _progessWidget();
  }

  return Column(
      mainAxisAlignment: MainAxisAlignment.center, children: children);
}

List<Widget> _dataWidget(
    AsyncSnapshot<Position> snapshot, List<Marker> markers) {
  return <Widget>[
    Flexible(
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(snapshot.data.latitude, snapshot.data.longitude),
          plugins: [
            MarkerClusterPlugin(),
          ],
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c']),
          MarkerClusterLayerOptions(
            maxClusterRadius: 120,
            size: Size(40, 40),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            markers: markers,
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            builder: (context, markers) {
              return FloatingActionButton(
                onPressed: null,
                child: Text(markers.length.toString()),
              );
            },
          ),
        ],
      ),
    )
  ];
}

List<Widget> _progessWidget() {
  return <Widget>[
    const SizedBox(
      width: 60,
      height: 60,
      child: CircularProgressIndicator(),
    ),
    const Padding(
      padding: EdgeInsets.only(top: 16),
      child: Text('Awaiting result...'),
    )
  ];
}

List<Widget> _errorWidget(Object error) {
  return <Widget>[
    const Icon(
      Icons.error_outline,
      color: Colors.red,
      size: 60,
    ),
    Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text('Error: $error'),
    )
  ];
}

List<Marker> _prepareMarkers(List<InventoryObject> data) {
  return data
      .map((element) => Marker(
            width: 20.0,
            height: 20.0,
            point: LatLng(
              element.coordinates.latitude,
              element.coordinates.longitude,
            ),
            builder: (ctx) => FlutterLogo(),
          ))
      .toList();
}
