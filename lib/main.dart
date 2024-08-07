import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_seller/cart_provider.dart';
import 'package:shoe_seller/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shoe Store',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.amber,
            primary: Colors.amber
            ),
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none
          ),
        ),
        home: const HomePage()
      ),
    );
  }
}

