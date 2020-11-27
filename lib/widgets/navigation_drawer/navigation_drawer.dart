import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wspieramprzyrode/routing/route_names.dart';
import 'package:wspieramprzyrode/widgets/navigation_drawer/drawer_item.dart';
import 'package:wspieramprzyrode/widgets/navigation_drawer/drawer_menu.dart';

import '../../l10n/l10n.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerItem(context.appLocalizations.home, homeRoute, Icons.home),
            DrawerMenu(context.appLocalizations.birds,
                FaIcon(FontAwesomeIcons.kiwiBird).icon, <Widget>[
              DrawerItem(
                  context.appLocalizations.birdsMap, mapRoute, Icons.map),
              DrawerItem(context.appLocalizations.birdsAddObject,
                  addNewObjectRoute, Icons.add),
            ]),
            Divider(height: 5.0),
            DrawerItem(context.appLocalizations.settings, settingsRoute,
                Icons.settings),
          ],
        ),
      ),
    );
  }
}
