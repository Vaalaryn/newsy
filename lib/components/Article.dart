import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer';
import 'dart:math';

class Article extends StatefulWidget {
  var data_;
  var color_;

  Article({Key key, @required this.color_, @required this.data_});

  @override
  _Article createState() => new _Article(data_: data_, color_: color_);
}

class _Article extends State<Article>
    with SingleTickerProviderStateMixin {

  var data_;
  var color_;

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


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(children: <Widget>[
              Container(
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
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
                Column(
                  children: <Widget>[
                    Text('Titre',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    Text('Source',
                        style:
                        TextStyle(color: color_, fontSize: 10)),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                Text("il y a 2 jours",
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
                              builder: (BuildContext context,
                                  Widget _widget) {
                                return new Transform.rotate(
                                  angle: animationController.value * 3.14 / 2,
                                  child: _widget,
                                );
                              },
                              child: Icon(Icons.keyboard_arrow_right,
                                  color: Colors.black)),
                          Text('En Savoir Plus',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16))
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
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16))
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                      onPressed: () {},
                      splashColor: Colors.redAccent,
                    ),
                    height: 50,
                  )),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          AnimatedContainer(
            child: Text("Intro : Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker."),
            duration: _Timer,
            height: _height,
          )],
      ),
      margin: const EdgeInsets.all(10.0),
      color: Colors.white,
    );
  }
}
