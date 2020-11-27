import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';

import '../../geolocation/gpslocation.dart';
import '../../locator.dart';
import '../../models/inventory_object.dart';
import '../../views/map/map_bloc.dart';

class MapView extends StatefulWidget {
  const MapView({Key key}) : super(key: key);

  @override
  MapViewState createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  List<Marker> markers = [];

  MapBloc mapBloc;

  @override
  void initState() {
    super.initState();
    mapBloc = locator.get<MapBloc>();
    mapBloc.add(MapEvent.loadMap);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      cubit: mapBloc,
      builder: (context, state) {
        if (state is MapLoading) {
          return _progressWidget();
        }

        if (state is MapLoaded) {
          return _dataWidget(state.position, _prepareMarkers(state.objects));
        }

        if (state is MapError) {
          return _errorWidget();
        }

        return Container();
      },
    );
  }

  Widget _dataWidget(
    GpsLocation position,
    List<Marker> markers,
  ) {
    return Column(
      children: <Widget>[
        Flexible(
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(position.latitude, position.longitude),
              plugins: [
                MarkerClusterPlugin(),
              ],
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
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
                  borderStrokeWidth: 3,
                ),
                builder: (context, markers) {
                  return FloatingActionButton(
                    onPressed: null,
                    child: Text(
                      markers.length.toString(),
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _progressWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text('Awaiting result...'),
        ),
      ],
    );
  }

  Widget _errorWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text('Unexpected error occurred'),
        ),
      ],
    );
  }

  List<Marker> _prepareMarkers(List<InventoryObject> data) {
    return data.map((element) {
      return Marker(
        width: 20.0,
        height: 20.0,
        point: LatLng(
          element.coordinates.latitude,
          element.coordinates.longitude,
        ),
        builder: (ctx) => FlutterLogo(),
      );
    }).toList();
  }
}
