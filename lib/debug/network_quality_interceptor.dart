import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../hive/box_extensions.dart';

const networkQualityTag = "NetworkQuality";
const double delayVariance = 0.40;

/// Ported from https://github.com/palaima/DebugDrawer
class NetworkQualityInterceptor extends Interceptor {
  final NetworkQualityConfig config;
  final Random random;
  final Dio dio;

  NetworkQualityInterceptor(this.config, this.dio) : random = Random();

  @override
  Future onRequest(RequestOptions options) async {
    if (!config.networkEnabled) {
      return dio.reject('$networkQualityTag: Network disabled.');
    }

    await _delay();

    if (_isFailure()) {
      return dio.reject('$networkQualityTag: Request failure.');
    } else {
      return options;
    }
  }

  Future<void> _delay() async {
    final int delay = _calculateDelayMs();
    if (delay > 0) {
      debugPrint("$networkQualityTag: Applying delay of $delay ms");
      return Future.delayed(Duration(milliseconds: delay));
    } else {
      return Future.value();
    }
  }

  int _calculateDelayMs() {
    if (config.delayMs <= 0) return 0;

    const lowerBound = 1.0 - delayVariance;
    const upperBound = 1.0 + delayVariance;
    const bound = upperBound - lowerBound;
    final delayPercent = lowerBound + random.nextDouble() * bound;

    return (config.delayMs * delayPercent).toInt();
  }

  bool _isFailure() => random.nextInt(100) < config.errorPercentage;
}

class NetworkQualityConfig {
  final Box configBox;

  NetworkQualityConfig(this.configBox);

  bool get networkEnabled =>
      configBox.getTyped<bool>("networkEnabled", defaultValue: true);

  set networkEnabled(bool networkEnabled) {
    configBox.put("networkEnabled", networkEnabled);
  }

  int get delayMs => configBox.getTyped("delayMs", defaultValue: 0);

  set delayMs(int delayMs) {
    configBox.put("delayMs", delayMs);
  }

  int get errorPercentage =>
      configBox.getTyped("errorPercentage", defaultValue: 0);

  set errorPercentage(int errorPercentage) {
    configBox.put("errorPercentage", errorPercentage);
  }
}
