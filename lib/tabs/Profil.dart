import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:newsy_v2/components/ColorButton.dart';
import 'package:newsy_v2/components/SettingsTitle.dart';
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
      SettingsTitle(title: "Info Profil"),
      FlatButton(
        color: Theme.of(context).primaryColor,
        child: Container(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text("Déconnexion",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.exit_to_app, color: Colors.white, size: 40),
            )),
        onPressed: () => {},
      ),
      SettingsTitle(title: "Theme"),
      ListTile(
          title: Text('Theme Sombre'),
          trailing: Switch(
            value: isSwitched,
            onChanged: (value) {
              isSwitched = value;
              ThemeSwitcher.of(context).switchTheme(ThemeData(
                primaryColor: Theme.of(context).primaryColor,
                accentColor: Theme.of(context).accentColor,

                backgroundColor:
                    value ? Color.fromRGBO(30, 30, 30, 1) : Colors.white,
                brightness: value ? Brightness.dark : Brightness.light,
//                  textTheme: TextTheme(
//                      body1: TextStyle(
//                          color: !value ? Colors.black : Colors.white))
              ));
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
                            ColorButton(color: Colors.purple),
                            ColorButton(color: Colors.red),
                            ColorButton(color: Colors.blue),
                            ColorButton(color: Colors.green),
                            ColorButton(color: Colors.pink),
                          ],
                        ),
                      ));
            }),
      ),
      SettingsTitle(title: "Langue"),
      ListTile(
        title: Text("Langue"),
        trailing: DropdownButton(
          items: [],
          onChanged: (item) {},
        ),
      ),
    ]));
  }
}
