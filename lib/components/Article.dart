import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:newsy_v2/controller/ArticleController.dart';

class Article extends StatefulWidget {
  var data_;
  var color_;

  Article({Key key, @required this.color_, @required this.data_});

  @override
  _Article createState() => new _Article(data_: data_, color_: color_);
}

class _Article extends State<Article> with SingleTickerProviderStateMixin {
  var data_;
  var color_;
  var articleController = ArticleController();

  _Article({Key key, @required this.color_, @required this.data_});

  AnimationController animationController;
  bool showMore = true;
  double height = 0.0;
  var _Timer = new Duration(milliseconds: 150);

  @override
  void initState() {
    super.initState();
    this.animationController = new AnimationController(
      vsync: this,
      duration: this._Timer,
    );
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
                  this.data_.urlToImage,
                  fit: BoxFit.cover,
                ),
                height: 180,
                width: double.infinity,
              ),
              Positioned(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.alarm_add,
                        color: color_,
                      ),
                      onPressed: () {},
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.star_border,
                            color: color_,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: color_,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Opacity(
                              opacity: 1.0,
                              child: Icon(
                                Icons.check,
                                color: color_,
                              )),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                right: 0,
              ),
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
                      AutoSizeText(this.data_.title,
                          minFontSize: 15,
                          maxLines: 3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black)),
                      Text(this.data_.source,
                          style: TextStyle(color: color_, fontSize: 10)),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                Text(this.articleController.convertDate(this.data_.publishedAt),
                    style: TextStyle(color: color_, fontSize: 10)),
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
                              color: Colors.black)),
                      Text('En Savoir Plus',
                          style: TextStyle(color: Colors.black, fontSize: 16))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  onPressed: this.articleController.animationButton,
                  splashColor: Colors.redAccent,
                ),
                height: 50,
              )),
              Expanded(
                  child: ButtonTheme(
                child: FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.reply, color: Colors.black),
                      Text("Lire l'article",
                          style: TextStyle(color: Colors.black, fontSize: 16))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  onPressed: () => articleController.launchURL(context, this.data_),
                  splashColor: Colors.redAccent,
                ),
                height: 50,
              )),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          AnimatedContainer(
            child: Text(
              this.data_.description,
              textAlign: TextAlign.justify,
            ),
            margin: EdgeInsets.all(6.0),
            duration: _Timer,
            height: height,
          )
        ],
      ),
      margin: const EdgeInsets.all(10.0),
      color: Colors.white,
    );
  }
}
