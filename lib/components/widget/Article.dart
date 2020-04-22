import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsy_v2/controller/ArticleController.dart';
import 'package:newsy_v2/generated/l10n.dart';
import 'package:newsy_v2/model/User.dart';
import 'package:share/share.dart';

class Article extends StatefulWidget {
  var data_;

  Article({Key key, @required this.data_});

  @override
  _Article createState() => new _Article(data_: data_);
}

class _Article extends State<Article> with SingleTickerProviderStateMixin {
  var data_;
  var articleController = ArticleController();
  var _Timer = new Duration(milliseconds: 150);

  AnimationController animationController;

  bool read = false;
  bool fav = false;
  bool push = false;
  bool showMore = true;

  double height = 0.0;

  _Article({Key key, @required this.data_});

  @override
  void initState() {
    super.initState();
    this.animationController = new AnimationController(
      vsync: this,
      duration: _Timer,
    );

    setState(() {
      this.fav = User.checkIfFavExist(jsonEncode(data_.raw));
      this.read = User.checkIfLuExist(jsonEncode(data_.raw));
    });
  }

  @override
  Widget build(BuildContext context) {
    this.articleController.setThat(this);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(children: <Widget>[
              Container(
                child: Image.network(
                  data_.urlToImage == null
                      ? 'http://placeimg.com/640/480/animals'
                      : data_.urlToImage,
                  fit: BoxFit.cover,
                ),
                height: 180,
                width: double.infinity,
              ),
              Positioned(
                child: Row(
                  children: <Widget>[
                    Column(children: <Widget>[
                      IconButton(
                        icon: Icon(!fav ? Icons.star_border : Icons.star,
                            color: !fav
                                ? Theme.of(context).backgroundColor
                                : Theme.of(context).primaryColor),
                        onPressed: articleController.favButton,
                      ),
//                      IconButton(
//                          icon: Icon(!push ? Icons.alarm_add : Icons.alarm_on,
//                              color: !push
//                                  ? Theme.of(context).backgroundColor
//                                  : Theme.of(context).primaryColor),
//                          onPressed: articleController.pushButton),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          final RenderBox box = context.findRenderObject();
                          Share.share(data_.url,
                              sharePositionOrigin:
                                  box.localToGlobal(Offset.zero) & box.size);
                        },
                      ),
                      Opacity(
                          opacity: read ? 1 : 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.check,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {},
                          ))
                    ])
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                right: 0,
              )
            ]),
            height: 180,
            width: double.infinity,
          ),
          Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.25),
                  child: Column(
                    children: <Widget>[
                      AutoSizeText(data_.title == null ? '' : data_.title,
                          minFontSize: 15,
                          maxLines: 3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Theme.of(context).textTheme.body1.color)),
                      Text(
                          data_.source == null
                              ? S.of(context).articleNoSource
                              : data_.source,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 10)),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                Text(articleController.convertDate(data_.publishedAt),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 10)),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            margin: EdgeInsets.all(5.0),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: ButtonTheme(
                child: FlatButton(
                  child: Row(
                    children: <Widget>[
                      AnimatedBuilder(
                          animation: animationController,
                          builder: (BuildContext context, Widget _widget) {
                            return new Transform.rotate(
                              angle: animationController.value * 3.14 / 2,
                              child: _widget,
                            );
                          },
                          child: Icon(Icons.keyboard_arrow_right,
                              color: Theme.of(context).primaryColor)),
                      Text(S.of(context).articleShowMore,
                          style: TextStyle(
                              color: Theme.of(context).textTheme.body1.color,
                              fontSize: 16))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  onPressed: articleController.animationButton,
                  splashColor: Theme.of(context).primaryColor,
                ),
                height: 50,
              )),
              Expanded(
                  child: ButtonTheme(
                child: FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.reply, color: Theme.of(context).primaryColor),
                      Text(S.of(context).articleReadArticle,
                          style: TextStyle(
                              color: Theme.of(context).textTheme.body1.color,
                              fontSize: 16))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  onPressed: () {
                    setState(() {
                      articleController.launchURL(context, this);
                    });
                  },
                  splashColor: Theme.of(context).primaryColor,
                ),
                height: 50,
              )),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          AnimatedContainer(
            child: Text(
              data_.description == null || data_.description == ""
                  ? data_.content == null
                      ? S.of(context).articleNoDesc
                      : data_.content
                  : data_.description,
              textAlign: TextAlign.justify,
            ),
            margin: showMore ? EdgeInsets.all(0) : EdgeInsets.all(5.0),
            duration: _Timer,
            height: showMore ? height : null,
          )
        ],
      ),
      margin: EdgeInsets.all(10.0),
      color: Theme.of(context).backgroundColor,
    );
  }
}
