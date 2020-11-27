import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'geolocation/geolocation.dart';
import 'locator.dart';
import 'logging_bloc_observer.dart';
import 'services/api/inventory_service.dart';

void main() {
  setupLocator();
  // Enable integration testing with the Flutter Driver extension.
  // See https://flutter.dev/testing/ for more info.
  enableFlutterDriverExtension();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = LoggingBlocObserver();

  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => locator.get<Dio>()),
      Provider(create: (_) => locator.get<GeolocationService>()),
      Provider(create: (_) => locator.get<InventoryService>()),
    ],
    child: App(),
  ));
}
