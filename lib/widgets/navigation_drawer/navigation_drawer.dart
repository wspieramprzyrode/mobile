import 'package:flutter/material.dart';
import 'package:wspieramprzyrode/routing/route_names.dart';
import 'package:wspieramprzyrode/widgets/navigation_drawer/drawer_item.dart';
import 'package:wspieramprzyrode/widgets/navigation_drawer/navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          DrawerItem('Start', HomeRoute, Icons.home),
          DrawerItem('Dodaj obiekt', AddNewObjectRoute, Icons.add),
          DrawerItem('O nas', AboutRoute, Icons.contacts),
        ],
      ),
    );
  }
}
