import 'package:flutter/material.dart';

class SettingsViewContentMobile extends StatelessWidget {
  const SettingsViewContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Welcome',
        ),
      ],
    );
  }
}
