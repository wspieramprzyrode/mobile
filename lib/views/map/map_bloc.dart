import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wspieramprzyrode/datamodels/inventory_object.dart';
import 'package:wspieramprzyrode/services/api/inventory_service.dart';
import 'package:wspieramprzyrode/services/geolocation_service.dart';

enum MapEvent { loadMap }

abstract class MapState {
  const MapState();
}

class MapEmpty extends MapState {}

class MapError extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final Position position;
  final List<InventoryObject> objects;

  MapLoaded({
    this.position,
    this.objects,
  });
}

class MapBloc extends Bloc<MapEvent, MapState> {
  final GeolocationService geolocationService;
  final InventoryService inventoryService;

  MapBloc({
    @required this.geolocationService,
    @required this.inventoryService,
  })  : assert(geolocationService != null),
        assert(inventoryService != null);

  @override
  MapState get initialState => MapEmpty();

  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
    switch (event) {
      case MapEvent.loadMap:
        yield* _initMap();
        break;
    }
  }

  Stream<MapState> _initMap() async* {
    yield MapLoading();
    try {
      final position = await geolocationService.getUserLocation();
      final objects = await inventoryService.getObjects();
      yield MapLoaded(position: position, objects: objects);
    } catch (_) {
      yield MapError();
    }
  }
}
