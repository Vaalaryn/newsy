import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsy/components/Article.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Container(child: Article(), height: 900),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.more_horiz),
      ),
    );
  }
}