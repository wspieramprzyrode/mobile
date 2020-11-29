import 'package:flutter/material.dart';

import '../assets_gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../locator.dart';
import '../routing/route_names.dart';
import '../services/navigation_service.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Assets.images.error404.image(),
              ),
              SizedBox(height: 48),
              Text(context.appLocalizations.errorNotFound),
              SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  locator<NavigationService>()
                      .navigator()
                      .popUntil(ModalRoute.withName(homeRoute));
                },
                child: Text(context.appLocalizations.goToHome),
              )
            ],
          ),
        ),
      ),
    );
  }
}
