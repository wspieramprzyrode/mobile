import 'package:flutter/material.dart';
import 'package:wspieramprzyrode/locator.dart';
import 'package:wspieramprzyrode/services/navigation_service.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final IconData icon;

  const DrawerItem(this.title, this.navigationPath, this.icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        locator<NavigationService>().navigateTo(navigationPath);
        Navigator.pop(context);
      },
    );
  }
}
