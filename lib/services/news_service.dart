import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:news_flutter/models/news.dart';

class NewsService {
  static Future<List<News>> getNews() async {
    await Future.delayed(Duration(seconds: 2)); // Giả lập độ trễ API

    final String jsonData = await rootBundle.loadString('assets/news.json');
    final List<dynamic> jsonList = json.decode(jsonData);
    return jsonList.map((json) => News.fromJson(json)).toList();
  }
}
