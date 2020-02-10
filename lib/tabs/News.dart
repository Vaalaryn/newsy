import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsy_v2/components/Article.dart';
import 'package:newsy_v2/components/DataArticle.dart';
import 'package:newsy_v2/factory/PostRequest.dart';

class News extends StatelessWidget {
  var post;
  var test =
      '{"source": {"id": "fox-news", "name": "Fox News"},"author": "Danielle Wallace","title":"Houston Astros blast \'misleading\' Sports Illustrated report over team exec\'s alleged remarks after ALCS win - Fox News","description":"The Houston Astros blasted a report published by Sports Illustrated Monday that claimed one of the team’s top executive shouted at three female reporters during post-game celebrations following the American League Championship Series win over the weekend.", "url":"https://www.foxnews.com/sports/houston-astros-sports-illustrated-brandon-taubman-assistant-general-manager-roberto-osuna-domestic-abuse","urlToImage":"https://static.foxnews.com/foxnews.com/content/uploads/2019/10/Carlos-Correa-2.jpg","publishedAt": "2019-10-22T10:00:59Z","content":"The Houston Astros blasted a report published by Sports Illustrated Monday that claimed one of the team’s top executive  taunted three female reporters during post-game celebrations following the American League Championship Series win over the weekend. The … [+2261 chars]"}';
  DataArticle data_;

  Future<PostRequest> fetchPost() async {
    final response = await http.get(
        '192.168.1.63/fr/api/newsy?token=RjGoRzoberAVObNnI8A8rR&mail=brice.bitot@neuf.fra&endpoint=top-headlines&params={"country": "fr"}');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      post = PostRequest.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load post');
    }
  }

  void initeState() async {
    final response = await http.get(
        '192.168.1.63/fr/api/newsy?token=RjGoRzoberAVObNnI8A8rR&mail=brice.bitot@neuf.fra&endpoint=top-headlines&params={"country": "fr"}');
    // If the server did return a 200 OK response, then parse the JSON.
    post = PostRequest.fromJson(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
//    data_ = DataArticle.fromJson(json.decode(test));

    return Scaffold(
      body: ListView(children: <Widget>[
        FutureBuilder<PostRequest>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.articles[0]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }),
        Article(data_: data_),
        Article(data_: data_),
        Article(data_: data_),
        Article(data_: data_),
        Article(data_: data_),
        Article(data_: data_),
        Article(data_: data_),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.more_horiz, color: Colors.white),
      ),
    );
  }
}
