import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

AppConfig get config => _config;
AppConfig _config;

class AppConfig {

  final String flavor;
  final String apiUrl;
  final bool debugLabel;

  AppConfig._({
    @required this.flavor,
    @required this.apiUrl,
    @required this.debugLabel
  });

  static void init({ @required flavor, @required apiUrl, @required debugLabel }) =>
    _config ??= AppConfig._(flavor: flavor, apiUrl: apiUrl, debugLabel: debugLabel);
}