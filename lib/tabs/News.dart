import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsy_v2/components/Article.dart';
import 'package:newsy_v2/components/DataArticle.dart';
import 'package:newsy_v2/factory/PostRequest.dart';
import 'package:flutter/foundation.dart';

class News extends StatefulWidget {
  @override
  NewsState createState() => new NewsState();
}

class NewsState extends State<News> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  var articles;
  DataArticle data_;

  Future<PostRequest> fetchPost() async {
    final response = await http.post('http://10.176.134.14' +
        '/fr/api/newsy?token=RjGoRzoberAVObNnI8A8rR&mail=brice.bitot@neuf.fra&endpoint=top-headlines&params={"country": "fr"}');

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
        return PostRequest.fromJson(json.decode(response.body)).articles;
       } else {
      throw Exception('Failed to load post');
    }
  }

  void initState() {
    setState(() {
      articles = fetchPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Article(data_: DataArticle.fromJson(articles[index]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            articles = fetchPost();
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.more_horiz, color: Colors.white),
      ),
    );
  }
}
