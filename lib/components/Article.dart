import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
//import 'package:url_launcher/url_launcher.dart';

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
  var now = new DateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'").format(DateTime.now());

  _Article({Key key, @required this.color_, @required this.data_});

  AnimationController animationController;
  bool showMore = true;
  double _height = 0;
  var _Timer = new Duration(milliseconds: 150);

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: _Timer,
    );
  }

  void animationButton() {
    showMore = !showMore;
    if (showMore) {
      animationController.reverse();
      setState(() {
        _height = 0;
      });
    } else {
      animationController.forward();
      setState(() {
        _height = null;
      });
    }
  }

//  void _launchURL() async {
//    var url = data_.url;
//    if (await canLaunch(url)) {
//      await launch(url, forceWebView: true);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }

  String convertDate(String date) {
    var now = new DateTime.now();
    DateTime dateTime = DateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'").parse(date);
    var deltaTime = now.difference(dateTime).inMinutes;
    String msg;
    if (deltaTime < 60) {
      msg = 'il y a $deltaTime minutes';
    } else if (deltaTime < 720) {
      deltaTime = (deltaTime / 60).floor();
      var s = (deltaTime != 1) ? 's' : '';
      msg = 'il y a $deltaTime heure' + s;
    } else if (deltaTime < 21600) {
      deltaTime = (deltaTime / 1440).floor();
      var s = (deltaTime != 1) ? 's' : '';
      msg = 'il y a $deltaTime jour' + s;
    } else if (deltaTime < 259200) {
      deltaTime = (deltaTime / 43200).floor();
      msg = 'il y a $deltaTime mois';
    } else {
      deltaTime = (deltaTime / 518400).floor();
      var s = (deltaTime != 1) ? 's' : '';
      msg = 'il y a $deltaTime an' + s;
    }
    return msg;
  }

  void goToWebPage() {}

  @override
  Widget build(BuildContext context) {
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
                Text(convertDate(this.data_.publishedAt),
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
                  onPressed: animationButton,
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
                  onPressed: () {}/*_launchURL*/,
                  splashColor: Colors.redAccent,
                ),
                height: 50,
              )),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          AnimatedContainer(
            child: Text(this.data_.description, textAlign: TextAlign.justify,),
            margin: EdgeInsets.all(6.0),
            duration: _Timer,
            height: _height,
          )
        ],
      ),
      margin: const EdgeInsets.all(10.0),
      color: Colors.white,
    );
  }
}
