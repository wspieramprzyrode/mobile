import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:wspieramprzyrode/views/layout_template/layout_template.dart';
import 'package:theme_provider/theme_provider.dart';
import 'locator.dart';

void main() {
  setupLocator();
  // Enable integration testing with the Flutter Driver extension.
  // See https://flutter.dev/testing/ for more info.
  enableFlutterDriverExtension();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ThemeProvider(
      themes: [
        AppTheme.light(),
        AppTheme.dark(),
      ],
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      child: MaterialApp(
      title: 'Wspieram Przyrodę',
      debugShowCheckedModeBanner: false,
      home: ThemeConsumer(
        child: LayoutTemplate(),
      )
    )
    );
  }
}
