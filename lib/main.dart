import 'package:flutter/material.dart';
import 'package:landing_page/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page',
      theme: ThemeData(primaryColor: Colors.white),
      home: Home(),
    );
  }
}
