import 'package:flutter/material.dart';
import 'package:flutter_application_2/intro_page.dart';
import 'package:flutter_application_2/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/bottomnavigation': (context) => IntroPage(),
        '/menupage': (context) => MenuPage(),
      },
    );
  }
}
