import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:math';

class Article extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Article>
    with SingleTickerProviderStateMixin {
  bool selected = false;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 7),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.star_border,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.share,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Opacity(
                                opacity: 1.0,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.red,
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
                              TextStyle(color: Colors.redAccent, fontSize: 10)),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Text("il y a 2 jours",
                      style: TextStyle(color: Colors.redAccent, fontSize: 10)),
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
                                angle: pi * 0,
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
                    onPressed: () {
                      setState(() {
                        animationController.forward();
                      });
                    },
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
                    onPressed: () {},
                    splashColor: Colors.redAccent,
                  ),
                  height: 50,
                )),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
                "Intro : Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker."),
          ],
        ),
        margin: const EdgeInsets.all(10.0),
        color: Colors.white,
      ),
    );
  }
}
