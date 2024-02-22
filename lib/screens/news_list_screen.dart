import 'package:flutter/material.dart';
import 'package:news_flutter/models/news.dart';
import 'package:news_flutter/services/news_service.dart';
import 'news_detail_screen.dart';

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  late Future<List<News>> _newsList;

  @override
  void initState() {
    super.initState();
    _newsList = NewsService.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('News')),
        backgroundColor:Colors.orangeAccent,
      ),
      body: FutureBuilder<List<News>>(
        future: _newsList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final news = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(news.title),
                    subtitle: Text(news.contentBlocks[0].content),
                    leading: Image.network(
                      news.contentBlocks[1].content,
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailScreen(news: news),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
