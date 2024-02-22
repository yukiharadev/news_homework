import 'package:flutter/material.dart';
import 'package:news_flutter/screens/news_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
