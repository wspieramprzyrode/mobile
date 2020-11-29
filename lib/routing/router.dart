import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../l10n/l10n.dart';
import '../routing/route_names.dart';
import '../views/add_new_object/add_new_object_view.dart';
import '../views/home/home_view.dart';
import '../views/map/map_view.dart';
import '../views/settings/settings_view.dart';
import '../widgets/navigation_drawer/navigation_drawer.dart';
import '../widgets/page_not_found.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  Widget child;
  const bool defaultAppBar = true;
  switch (settings.name) {
    case homeRoute:
      child = HomeView();
      break;
    case addNewObjectRoute:
      child = AddNewObjectView();
      break;
    case settingsRoute:
      child = SettingsView();
      break;
    case mapRoute:
      child = MapView();
      break;
/*
    Example of disabling global app bar for specific route
    case detailsRoute:
      defaultAppBar = false;
      child = ObjectDetailsView();
    break;*/
    default:
      return MaterialPageRoute(builder: (_) => PageNotFound());
  }
  return _getPageRoute(
      _wrap(
        child,
        defaultAppBar: defaultAppBar, // ignore: avoid_redundant_argument_values
      ),
      settings);
}

Widget _wrap(Widget child, {bool defaultAppBar = true}) {
  return ResponsiveBuilder(
    builder: (context, sizingInformation) => Scaffold(
      drawer: NavigationDrawer(),
      appBar: defaultAppBar
          ? AppBar(
              title: Text(context.appLocalizations.appName),
            )
          : null,
      body: SafeArea(child: Center(child: child)),
    ),
  );
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
