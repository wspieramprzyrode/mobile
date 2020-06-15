import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wspieramprzyrode/routing/route_names.dart';
import 'package:wspieramprzyrode/views/add_new_object/add_new_object_view.dart';
import 'package:wspieramprzyrode/views/home/home_view.dart';
import 'package:wspieramprzyrode/views/map/map_view.dart';
import 'package:wspieramprzyrode/views/settings/settings_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(HomeView(), settings);
    case addNewObjectRoute:
      return _getPageRoute(AddNewObjectView(), settings);
    case settingsRoute:
      return _getPageRoute(SettingsView(), settings);
    case mapRoute:
      return _getPageRoute(MapView(), settings);
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
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
