import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

AppConfig get config => _config;
AppConfig _config;

class AppConfig {

  final String flavor;
  final String apiUrl;

  AppConfig._({
    @required this.flavor,
    @required this.apiUrl
  });

  static void init({ @required flavor, @required apiUrl }) =>
    _config ??= AppConfig._(flavor: flavor, apiUrl: apiUrl);
}