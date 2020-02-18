import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:newsy_v2/components/ColorButton.dart';
import 'package:newsy_v2/components/SettingsTitle.dart';
import 'package:newsy_v2/components/UserData.dart';
import 'package:newsy_v2/generated/l10n.dart';
import 'package:newsy_v2/main.dart';

class Profil extends StatefulWidget {
  createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  static bool isSwitched = false;

  List<Color> colorButton = [
    Colors.purple,
    Colors.pinkAccent,
    Colors.red,
    Color.fromRGBO(255, 99, 71, 1),
    Color.fromRGBO(255, 125, 125, 1),
    Colors.orange,
    Colors.yellow,
    Color.fromRGBO(125, 255, 125, 1),
    Colors.lightGreen,
    Colors.green,
    Colors.cyan,
    Colors.blue,
    Color.fromRGBO(125, 125, 255, 1),
    Colors.deepPurple,
    Colors.grey
  ];

  List<Widget> _buildColorButton(BuildContext context) {
    var colorsGroup = List<Widget>();

    colorButton
        .forEach((color) => {colorsGroup.add(ColorButton(color: color))});

    return colorsGroup;
  }

  @override
  Widget build(BuildContext context) {
    var dropValue = S.of(context).actualLocale;

    return Scaffold(
        body: ListView(children: <Widget>[
      SettingsTitle(title: S.of(context).profilUser),
      UserData(),
      FlatButton(
        color: Theme.of(context).primaryColor,
        child: Container(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(S.of(context).profilDisconnect,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.exit_to_app, color: Colors.white, size: 40),
            )),
        onPressed: () => {},
      ),
      SettingsTitle(title: S.of(context).profilThemeTitle),
      ListTile(
          title: Text(S.of(context).profilDarkTheme),
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
              ));
            },
            activeTrackColor: Theme.of(context).primaryColor,
            activeColor: Theme.of(context).accentColor,
          )),
      ListTile(
        title: Text(S.of(context).profilColorSelect),
        trailing: IconButton(
            icon: CircleColor(
                color: Theme.of(context).primaryColor, circleSize: 60),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => new AlertDialog(
                        content: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          children: _buildColorButton(context),
                        ),
                      ));
            }),
      ),
      SettingsTitle(title: S.of(context).profilLangTitle),
      ListTile(
        title: Text(S.of(context).profilLangLabel),
        trailing: DropdownButton(
          value: dropValue,
          items: [
            DropdownMenuItem(
                value: 'fr',
                child: Row(
                  children: <Widget>[
                    Flags.getMiniFlag('FR', null, 30),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(S.of(context).profilLangFr),
                    )
                  ],
                )),
            DropdownMenuItem(
                value: 'en',
                child: Row(
                  children: <Widget>[
                    Flags.getMiniFlag('GB', null, 30),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(S.of(context).profilLangEn),
                    )
                  ],
                )),
            DropdownMenuItem(
                value: 'es',
                child: Row(
                  children: <Widget>[
                    Flags.getMiniFlag('ES', null, 30),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(S.of(context).profilLangEs),
                    )
                  ],
                )),
            DropdownMenuItem(
                value: 'de',
                child: Row(
                  children: <Widget>[
                    Flags.getMiniFlag('DE', null, 30),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(S.of(context).profilLangDe),
                    )
                  ],
                )),
            DropdownMenuItem(
                value: 'jp',
                child: Row(
                  children: <Widget>[
                    Flags.getMiniFlag('JP', null, 30),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(S.of(context).profilLangJp),
                    )
                  ],
                )),
          ],
          onChanged: (item) {
            setState(() {
              dropValue = item;
              S.load(Locale(item, ''));
            });
          },
        ),
      ),
    ]));
  }
}
