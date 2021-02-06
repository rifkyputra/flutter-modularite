import 'package:flutter/material.dart';

enum BuildType {
  Release,
  Debug,
  Development,
  Pre,
}

class AppConfig {
  final List<Module> modules;
  final int msTimeout;
  final EnvironmentVariables env;
  final String bannerLabel;
  final bool showBanner;
  final BuildType type;

  AppConfig({
    this.modules,
    this.env,
    this.msTimeout,
    this.bannerLabel,
    this.type,
    this.showBanner = false,
  });

  copyWith({
    List<Module> modules,
    EnvironmentVariables env,
    String bannerLabel,
    int msTimeout,
    bool showBanner,
    BuildType type,
  }) {
    return AppConfig(
      env: env ?? this.env,
      modules: modules ?? this.modules,
      bannerLabel: bannerLabel ?? this.bannerLabel,
      msTimeout: msTimeout ?? this.msTimeout,
      showBanner: showBanner ?? this.showBanner,
      type: type ?? this.type,
    );
  }

  Widget renderModule(String moduleName) {
    return modules.firstWhere((widget) => widget.name == moduleName).content ??
        SizedBox();
  }

  factory AppConfig.development({String bannerLabel, List<Module> modules}) {
    return AppConfig(
      env: MyEnvironment(),
      type: BuildType.Development,
      msTimeout: 3000,
      showBanner: true,
      bannerLabel: bannerLabel ?? 'Development',
      modules: modules,
    );
  }

  factory AppConfig.preRelease() {
    return AppConfig();
  }

  factory AppConfig.release() {
    return AppConfig();
  }

  static void mainCallback() {}
}

class Modularite extends InheritedWidget {
  final AppConfig config;
  final Widget root;

  static Widget _useParentWidget({
    Widget root,
    AppConfig config,
  }) {
    if (!config.showBanner) return root;

    return Banner(
      color: Colors.lime,
      message: config.bannerLabel,
      location: BannerLocation.bottomEnd,
      child: root,
    );
  }

  Modularite({Key key, this.config, this.root})
      : super(
          key: key,
          child: _useParentWidget(config: config, root: root),
        );

  static Modularite of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Modularite>();
  }

  @override
  bool updateShouldNotify(Modularite oldWidget) {
    return oldWidget.config != config;
  }
}

class Module {
  final String name;
  final Map settings;
  final Widget content;

  Module({this.name, this.settings, this.content});
}

///
/// Sample
///
class MyEnvironment extends EnvironmentVariables {
  final String baseUrl = 'some_url';
  final String misnomer = 'adfa';
  final String appName = 'my_application_name';
  final String alias = 'my_alis';
}

abstract class EnvironmentVariables {
  get baseUrl => null;
  get apiKey => null;
}
