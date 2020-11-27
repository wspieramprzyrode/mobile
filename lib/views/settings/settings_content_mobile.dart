import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

import '../../l10n/l10n.dart';

class SettingsViewContentMobile extends StatefulWidget {
  const SettingsViewContentMobile({Key key}) : super(key: key);

  @override
  _SettingsViewContentMobileState createState() =>
      _SettingsViewContentMobileState();
}

class _SettingsViewContentMobileState extends State<SettingsViewContentMobile> {
  @override
  void initState() {
    /// Call out to intialize platform state.
    initPlatformState();
    super.initState();
  }

  /// Initialize platform state.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            AppSettings.openLocationSettings();
          },
          child: Text(context.appLocalizations.locationSettings),
        ),
        RaisedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => ThemeConsumer(child: ThemeDialog()));
          },
          child: Text(context.appLocalizations.changeTheme),
        ),
      ],
    );
  }
}
