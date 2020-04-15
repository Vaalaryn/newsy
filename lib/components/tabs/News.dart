import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsy_v2/components/widget/Article.dart';
import 'package:newsy_v2/components/widget/FilterDialog.dart';
import 'package:newsy_v2/config/Constante.dart';
import 'package:newsy_v2/factory/DataArticle.dart';
import 'package:newsy_v2/components/widget/Loader.dart';
import 'package:newsy_v2/factory/PostRequest.dart';
import 'package:newsy_v2/model/User.dart';

class News extends StatefulWidget {
  @override
  News({Key key}) : super(key: key);

  NewsState createState() => new NewsState();
}

class NewsState extends State<News> with AutomaticKeepAliveClientMixin<News> {
  @override
  bool get wantKeepAlive => true;

  var post;
  String actualUrl;

  Future<PostRequest> fetchPost(String url) async {
    final response = await http.post(Constante.baseApiUrl + url);
    if (response.statusCode == 200) {
      actualUrl = url;
      return PostRequest.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  void initState() {
    actualUrl = '/fr/api/newsy?token=' + User.credToken + '&mail=' + User.credMail + '&endpoint=top-headlines&params={"country": "jp"}';
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
            } else if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: ColorLoader(
                      colors: [Theme.of(context).primaryColor],
                      duration: Duration(days: 365)));
            }else {
              return Center(
                child: Text(""),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => FilterDialog(that: this)
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.more_horiz, color: Colors.white),
      ),
    );
  }
}
