import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsy/components/Article.dart';

class News extends StatelessWidget {

  var data_;
  var color_;

  News({Key key, @required this.color_});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Article(color_: color_, data_: "test"),
        Article(color_: color_, data_: "test"),
        Article(color_: color_, data_: "test"),
        Article(color_: color_, data_: "test"),
        Article(color_: color_, data_: "test"),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.more_horiz, color: Colors.white),
      ),
    );
  }
}