import 'package:flutter/material.dart';
import 'package:shop_ui/pages/checkout.dart';
import 'package:shop_ui/pages/indipasta.dart';
import 'package:shop_ui/pages/paster.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Paster.id,
      routes: {
        Paster.id: (context) => Paster(),
        IndiPasta.id: (context) => IndiPasta(),
        Checkout.id: (context) => Checkout()
      },
    );
  }
}
