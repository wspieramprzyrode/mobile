import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Text(context.appLocalizations.appName)
        ],
      ),
    );
  }
}
