import 'package:flutter/cupertino.dart';
import 'package:modularite/configs.dart';
import 'package:modularite/main.dart';

extension Modular on BuildContext {
  AppConfig get config => Modularite.of(this).config;
  String get enabledModules => Modularite.of(this).config.modules.toString();
}
