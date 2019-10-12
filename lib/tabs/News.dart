import 'package:flutter/material.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
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
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Opacity(
                                    opacity: 1.0,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.green,
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          Text('Source',
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 10)),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      Text("il y a 2 jours",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 10)),
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
                            Icon(Icons.keyboard_arrow_right,
                                color: Colors.black),
                            Text('En Savoir Plus',
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
                )
              ],
            ),
            margin: const EdgeInsets.all(10.0),
            color: Colors.white,
          ),
          Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.more_horiz),
      ),
    );
  }
}
