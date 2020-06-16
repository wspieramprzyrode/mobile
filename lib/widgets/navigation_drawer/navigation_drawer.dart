import 'package:flutter/material.dart';
import 'package:wspieramprzyrode/i18n/localization.dart';
import 'package:wspieramprzyrode/routing/route_names.dart';
import 'package:wspieramprzyrode/widgets/navigation_drawer/drawer_item.dart';
import 'package:wspieramprzyrode/widgets/navigation_drawer/drawer_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerItem(AppLocalization.home, homeRoute, Icons.home),
            DrawerMenu(AppLocalization.birds, FaIcon(FontAwesomeIcons.kiwiBird).icon, <Widget>[
              DrawerItem(AppLocalization.birdsMap, mapRoute, Icons.map),
              DrawerItem(AppLocalization.birdsAddObject, addNewObjectRoute, Icons.add),
            ]),
            Divider(height: 5.0),
            DrawerItem(AppLocalization.settings, settingsRoute, Icons.settings),
          ],
        ),
      ),
    );
  }
}
