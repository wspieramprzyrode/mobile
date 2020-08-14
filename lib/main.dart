import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:wspieramprzyrode/services/api/inventory_service.dart';
import 'package:wspieramprzyrode/services/geolocation/geolocation_service.dart';
import 'package:wspieramprzyrode/logging_bloc_observer.dart';
import 'package:wspieramprzyrode/views/layout_template/layout_template.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'i18n/localization.dart';
import 'locator.dart';

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
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: [
        AppTheme.light(),
        AppTheme.dark(),
      ],
      defaultThemeId: AppTheme.dark().id,
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      child: MaterialApp(
        title: AppLocalization.appName,
        debugShowCheckedModeBanner: false,
        home: ThemeConsumer(
          child: LayoutTemplate(),
        ),
      ),
    );
  }
}
