import 'package:flutter/material.dart';
import 'package:newsy_v2/components/Article.dart';
import 'package:newsy_v2/components/DataArticle.dart';
import 'dart:convert';

class News extends StatelessWidget {
  var test =
      '{"source": {"id": "fox-news", "name": "Fox News"},"author": "Danielle Wallace","title":"Houston Astros blast \'misleading\' Sports Illustrated report over team exec\'s alleged remarks after ALCS win - Fox News","description":"The Houston Astros blasted a report published by Sports Illustrated Monday that claimed one of the team’s top executive shouted at three female reporters during post-game celebrations following the American League Championship Series win over the weekend.", "url":"https://www.foxnews.com/sports/houston-astros-sports-illustrated-brandon-taubman-assistant-general-manager-roberto-osuna-domestic-abuse","urlToImage":"https://static.foxnews.com/foxnews.com/content/uploads/2019/10/Carlos-Correa-2.jpg","publishedAt": "2019-10-22T10:00:59Z","content":"The Houston Astros blasted a report published by Sports Illustrated Monday that claimed one of the team’s top executive  taunted three female reporters during post-game celebrations following the American League Championship Series win over the weekend. The … [+2261 chars]"}';
  var color_;
  DataArticle data_;

  News({Key key, @required this.color_});

  @override
  Widget build(BuildContext context) {
    data_ = DataArticle.fromJson(json.decode(test));
    return Scaffold(
      body: ListView(children: <Widget>[
        Article(color_: color_, data_: data_),
        Article(color_: color_, data_: data_),
        Article(color_: color_, data_: data_),
        Article(color_: color_, data_: data_),
        Article(color_: color_, data_: data_),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.more_horiz, color: Colors.white),
      ),
    );
  }
}
