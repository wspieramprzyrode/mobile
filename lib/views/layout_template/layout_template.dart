import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wspieramprzyrode/locator.dart';
import 'package:wspieramprzyrode/routing/route_names.dart';
import 'package:wspieramprzyrode/routing/router.dart';
import 'package:wspieramprzyrode/services/navigation_service.dart';
import 'package:wspieramprzyrode/widgets/navigation_bar/navigation_bar.dart';
import 'package:wspieramprzyrode/widgets/navigation_drawer/navigation_drawer.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: const NavigationDrawer(),
        body: Column(
            children: <Widget>[
              const  NavigationBar(),
              Expanded(
                child: Navigator(
                  key: locator<NavigationService>().navigatorKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: HomeRoute,
                ),
              )
            ],
          ),
        ),
    );
  }
}
