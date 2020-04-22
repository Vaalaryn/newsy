import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsy_v2/components/widget/Article.dart';
import 'package:newsy_v2/factory/DataArticle.dart';
import 'package:newsy_v2/model/User.dart';

class Fav extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: User.articleFavoris.length,
          itemBuilder: (context, index) {
            return Article(
                data_:
                    // TODO article lu historique juste nom + lien
                DataArticle.fromJson(jsonDecode(User.articleFavoris[User.articleFavoris.length - index - 1])));
          },
        )
    );
  }
}
