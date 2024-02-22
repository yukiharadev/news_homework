import 'package:flutter/material.dart';
import 'package:news_flutter/models/news.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;

  NewsDetailScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(news.title, style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 16),
            ...news.contentBlocks.map((block) {
              if (block.type == 'text') {
                return Text(block.content);
              } else if (block.type == 'image') {
                return CachedNetworkImage(
                  imageUrl: block.content,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
              } else {
                return SizedBox.shrink(); // Xử lý trường hợp không xác định
              }
            }).toList(),
          ],
        ),
      ),
    );
  }
}
