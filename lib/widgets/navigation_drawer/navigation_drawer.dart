import 'package:flutter/material.dart';
import 'package:wspieramprzyrode/routing/route_names.dart';
import 'package:wspieramprzyrode/widgets/navigation_drawer/drawer_item.dart';
import 'package:wspieramprzyrode/widgets/navigation_drawer/drawer_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
        padding: const EdgeInsets.only(left: 20, top: 80),
        children: <Widget>[
          DrawerItem('Start', HomeRoute, Icons.home),
          DrawerMenu('Ptaki',  FaIcon(FontAwesomeIcons.kiwiBird).icon, <Widget>[
            DrawerItem('Mapa', MapRoute, Icons.map),
            DrawerItem('Dodaj obiekt', AddNewObjectRoute, Icons.add),
          ]),
          Divider(height: 5.0),
          DrawerItem('Ustawienia', SettingsRoute, Icons.settings),
        ],

    );
  }
}