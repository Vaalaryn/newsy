import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsy_v2/components/Article.dart';
import 'package:newsy_v2/components/DataArticle.dart';
import 'package:newsy_v2/factory/PostRequest.dart';
import 'package:flutter/foundation.dart';
import 'package:newsy_v2/components/Loader.dart';

class News extends StatefulWidget {
  @override
  News({Key key}) : super(key: key);
  NewsState createState() => new NewsState();
}

class NewsState extends State<News> with AutomaticKeepAliveClientMixin<News> {

  @override
  bool get wantKeepAlive => true;

  var post;

  Future<PostRequest> fetchPost() async {
    final response = await http.post('http://10.176.134.14' +
        '/fr/api/newsy?token=RjGoRzoberAVObNnI8A8rR&mail=brice.bitot@neuf.fra&endpoint=top-headlines&params={"country": "fr"}');
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return PostRequest.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  void initState() {
    debugPrint("Init");
//    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: FutureBuilder(
          future: post,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  return Article(
                      data_:
                          DataArticle.fromJson(snapshot.data.articles[index]));
                },
              );
            } else {
              return Center(
                  child: ColorLoader(
                      colors: [Theme.of(context).primaryColor],
                      duration: Duration(days: 365)));
            }}),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            post = fetchPost();
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.more_horiz, color: Colors.white),
      ),
    );
  }
}
