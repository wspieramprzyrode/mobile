import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'geolocation/geolocation.dart';
import 'services/api/inventory_service.dart';
import 'services/navigation_service.dart';
import 'views/map/map_bloc.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator
    ..registerLazySingleton<Dio>(() {
      final dio = Dio();
      dio.interceptors.add(
        PrettyDioLogger(requestHeader: true, requestBody: true),
      );
      return dio;
    })
    ..registerLazySingleton<NavigationService>(() => NavigationService())
    ..registerLazySingleton<GeolocationService>(() => GeolocationService())
    ..registerLazySingleton<InventoryService>(
        () => InventoryService(locator.get()))
    ..registerFactory<MapBloc>(() => MapBloc(
          geolocationService: locator.get(),
          inventoryService: locator.get(),
        ));
}
