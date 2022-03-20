import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page_screen.dart';
import 'package:store_app/screens/update_product_screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => const HomePage(),
        UpdateProductScreen.route: (context) => const UpdateProductScreen()
      },
    );
  }
}
