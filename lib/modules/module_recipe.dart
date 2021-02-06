import 'package:flutter/material.dart';
import 'package:modularite/configs.dart';
import 'package:modularite/modules/checkout_module.dart';

class ModuleRecipe {
  static List<Module> vendorApp() {
    return <Module>[
      Module(
        name: 'Checkout',
        content: CheckoutModule(),
        settings: {},
      )
    ];
  }
}
