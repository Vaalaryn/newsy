import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:newsy_v2/main.dart';

class Profil extends StatefulWidget {
  createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  static bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      ListTile(
          title: Text('Theme Sombre'),
          trailing: Switch(
            value: isSwitched,
            onChanged: (value) {
              isSwitched = value;
              ThemeSwitcher.of(context).switchTheme(ThemeData(
                  primaryColor: Theme.of(context).primaryColor,
                  accentColor: Theme.of(context).accentColor,
                  backgroundColor: value ? Colors.black : Colors.white,
                  brightness: value ? Brightness.dark : Brightness.light,
                  textTheme: TextTheme(
                      body1: TextStyle(
                          color: !value ? Colors.black : Colors.white))));
            },
            activeTrackColor: Theme.of(context).primaryColor,
            activeColor: Theme.of(context).accentColor,
          )),
      ListTile(
        title: Text('Couleur principale'),
        trailing: IconButton(
            icon: CircleColor(
                color: Theme.of(context).primaryColor, circleSize: 60),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => new AlertDialog(
                        content: Row(
                          children: <Widget>[
                            IconButton(icon: CircleColor(color: Colors.blueAccent, circleSize: 60), onPressed: () {
                            Navigator.pop(context);
                            ThemeSwitcher.of(context).switchTheme(ThemeData(
                                primaryColor: Colors.blueAccent,
                                accentColor: Colors.blueAccent,
                                backgroundColor: Theme.of(context).backgroundColor,
                                brightness: Theme.of(context).brightness,
                                textTheme: Theme.of(context).textTheme));
                            }),
                            IconButton(icon: CircleColor(color: Colors.red, circleSize: 60), onPressed: () {
                            Navigator.pop(context);
                            ThemeSwitcher.of(context).switchTheme(ThemeData(
                                primaryColor: Colors.red,
                                accentColor: Colors.redAccent,
                                backgroundColor: Theme.of(context).backgroundColor,
                                brightness: Theme.of(context).brightness,
                                textTheme: Theme.of(context).textTheme));
                            }),
                          ],
                        ),
                      ));
            }),
      )
    ]));
  }
}
