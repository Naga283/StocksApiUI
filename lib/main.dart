// ignore_for_file: prefer_const_constructors
//@dart = 2.9
import 'package:flutter/material.dart';
import 'package:goindiastocks/apis/bulkdeal/newapi.dart';
import 'package:goindiastocks/apis/try/newdata.dart';
import 'package:goindiastocks/apis/try/searchpage.dart';
import 'package:goindiastocks/homepage.dart';
import 'package:goindiastocks/practice/lib/pages/homepage.dart';
void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AllApi(),
      ),
    );
  }
}