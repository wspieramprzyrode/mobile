import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:theme_provider/theme_provider.dart';

import 'l10n/l10n.dart';
import 'locator.dart';
import 'routing/route_names.dart';
import 'routing/router.dart';
import 'services/navigation_service.dart';

class App extends StatelessWidget {
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
        onGenerateTitle: (context) => context.appLocalizations.appName,
        debugShowCheckedModeBanner: false,
        home: ThemeConsumer(
          child: Navigator(
            key: locator<NavigationService>().navigatorKey,
            onGenerateRoute: generateRoute,
            initialRoute: homeRoute,
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('pl', 'PL'),
        ],
      ),
    );
  }
}
