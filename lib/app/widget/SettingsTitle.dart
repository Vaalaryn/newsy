import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsTitle extends StatelessWidget {
  String title;
  SettingsTitle({Key key, @required this.title});

  @override
  Widget build(BuildContext context) {
    return       Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3
            )
        ),
      ),
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Theme.of(context).primaryColor)),
      ),
    );
  }
}