import 'package:flutter/material.dart';
import 'package:ninja_worldtime/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "beginners world time ",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
