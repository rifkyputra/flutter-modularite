import 'package:flutter/material.dart';
import 'package:modularite/configs.dart';
import 'package:modularite/extensions.dart';
import 'package:modularite/modules/module_recipe.dart';

void main() async {
  AppConfig.mainCallback();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Modularite(
        config: AppConfig.development(
          modules: ModuleRecipe.vendorApp(),
        ),
        root: Builder(
          builder: (context) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Text('PizzaRia'),
                    Text(context.config.env.baseUrl),
                    // Text(context.config.m),
                    Text(context.enabledModules),
                    context.config.renderModule('Checkout'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
