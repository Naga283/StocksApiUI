//@dart=2.9
import 'dart:convert';

import 'package:goindiastocks/practice/lib/constants/strings.dart';
import 'package:goindiastocks/practice/lib/models/newsInfo.dart';
import 'package:http/http.dart' as http;


// ignore: camel_case_types
class API_Manager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Uri.parse(Strings.news_url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
