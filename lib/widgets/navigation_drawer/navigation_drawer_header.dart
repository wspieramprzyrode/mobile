import 'package:flutter/material.dart';
class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      //color: Theme.of(context).accentColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Wspieram Przyrodę',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w800),
         ),
        ],
      ),
    );
  }
}
