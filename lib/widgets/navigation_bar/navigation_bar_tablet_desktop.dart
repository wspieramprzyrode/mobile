import 'package:flutter/material.dart';
import 'package:wspieramprzyrode/routing/route_names.dart';
import 'package:wspieramprzyrode/widgets/navigation_bar/navbar_item.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem("Start", HomeRoute, icon: Icons.home),
              SizedBox(
                width: 20,
              ),
              NavBarItem("Dodaj obiekt", AddNewObjectRoute, icon: Icons.add),
              SizedBox(
                width: 20,
              ),
              NavBarItem("O Nas", AboutRoute, icon: Icons.contacts)
            ],
          )
        ],
      ),
    );
  }
}
