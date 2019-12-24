import 'package:flutter/material.dart';
import 'package:online_coaching/pages/base_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAMA',
      debugShowCheckedModeBanner: false,
      home: BasePage(),
    );
  }
}