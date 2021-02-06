import 'package:flutter/material.dart';

class CheckoutModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('ok');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.indigo,
        ),
        child: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
