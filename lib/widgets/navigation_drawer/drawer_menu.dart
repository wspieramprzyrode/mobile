import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final IconData icon;

  const DrawerMenu(this.title, this.icon, this.children);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon),
        title: Text(title),
      ),
      children: children,
    );
  }
}
