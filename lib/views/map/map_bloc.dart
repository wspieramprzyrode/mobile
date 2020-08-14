import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:wspieramprzyrode/models/gps.dart';
import 'package:wspieramprzyrode/models/inventory_object.dart';
import 'package:wspieramprzyrode/services/api/inventory_service.dart';
import 'package:wspieramprzyrode/services/geolocation/geolocation_service.dart';

enum MapEvent { loadMap }

abstract class MapState {
  const MapState();
}

class MapEmpty extends MapState {}

class MapError extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final GpsLocation position;
  final List<InventoryObject> objects;

  MapLoaded({
    this.position,
    this.objects,
  });
}

class MapBloc extends Bloc<MapEvent, MapState> {
  final GeolocationService geolocationService;
  final InventoryService inventoryService;

  GpsLocation _userPosition;
  List<InventoryObject> _objects = [];

  MapBloc({
    @required this.geolocationService,
    @required this.inventoryService,
  }) : super(MapEmpty());

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
    await getObjects();
    try {
      _userPosition = await geolocationService.getUserLocation();
      yield MapLoaded(position: _userPosition, objects: _objects);
    } catch (_) {
      yield MapError();
    }
  }

  Future<void> getObjects() async {
    try {
      _objects = await inventoryService.getObjects();
    } catch (_) {
      debugPrint('failed to get objects');
    }
  }
}
