import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsy_v2/app/widget/Article.dart';
import 'package:newsy_v2/factory/DataArticle.dart';
import 'package:newsy_v2/app/model/User.dart';

class ReadHistory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          iconTheme:
          IconThemeData(color: Theme.of(context).textTheme.body1.color),
          bottom: PreferredSize(
              child: Container(
                color: Theme.of(context).primaryColor,
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          actions: <Widget>[]),
        body: ListView.builder(
          itemCount: User.articleLu.length,
          itemBuilder: (context, index) {
            return Article(
                data_:
                DataArticle.fromJson(jsonDecode(User.articleLu[User.articleLu.length - index - 1])));
          },
        )
    );
  }
}
