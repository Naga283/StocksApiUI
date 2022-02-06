// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:goindiastocks/homepage.dart';
void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}