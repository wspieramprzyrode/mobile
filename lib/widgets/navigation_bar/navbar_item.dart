import 'package:flutter/material.dart';
import 'package:wspieramprzyrode/datamodels/navbar_item_model.dart';
import 'package:wspieramprzyrode/locator.dart';
import 'package:wspieramprzyrode/services/navigation_service.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final IconData icon;
  const NavBarItem(this.title, this.navigationPath, {this.icon});

  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(
      title: title,
      navigationPath: navigationPath,
      iconData: icon,
    );
    return GestureDetector(
        onTap: () {
          locator<NavigationService>().navigateTo(navigationPath);
        },
        child: Padding(
            padding: EdgeInsets.zero,
            child: Row(
              children: <Widget>[
                Icon(model.iconData),
                Text(
                  model.title,
                )
              ],
            )));
  }
}
