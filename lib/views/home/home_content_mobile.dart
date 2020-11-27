import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(context.appLocalizations.welcome),
      ],
    );
  }
}
