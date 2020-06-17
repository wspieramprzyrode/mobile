import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wspieramprzyrode/services/api/inventory_service.dart';
import 'package:wspieramprzyrode/services/geolocation_service.dart';
import 'package:wspieramprzyrode/services/navigation_service.dart';
import 'package:wspieramprzyrode/views/map/map_bloc.dart';

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
    ..registerLazySingleton<InventoryService>(() => InventoryService(locator.get()))
    ..registerFactory<MapBloc>(() => MapBloc(
          geolocationService: locator.get(),
          inventoryService: locator.get(),
        ));
}
