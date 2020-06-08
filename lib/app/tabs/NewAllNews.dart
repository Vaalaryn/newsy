import 'package:flutter/material.dart';

class NewAllNews extends StatefulWidget {
  @override
  NewAllNewsState createState() => NewAllNewsState();
}

class NewAllNewsState extends State<NewAllNews> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[],
        ),
        FlatButton(
          color: Theme.of(context).primaryColor,
          child: Container(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text("Sauvegarder",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.add, color: Colors.white, size: 40),
              )),
          onPressed: () => {},
        ),
      ],
    );
  }
}
