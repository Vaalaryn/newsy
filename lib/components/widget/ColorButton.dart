import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:newsy_v2/config/AllColors.dart';
import 'package:newsy_v2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorButton extends StatefulWidget {
  Color color;

  ColorButton({Key key, @required this.color});

  createState() =>
      ColorButtonState(color: this.color);
}

class ColorButtonState extends State<ColorButton> {
  Color color;

  ColorButtonState({Key key, @required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: CircleColor(color: this.color, circleSize: 50),
        onPressed: () async {

          Future<SharedPreferences> prefs = SharedPreferences.getInstance();
          prefs.then((SharedPreferences prefs) {
            prefs.setInt('themeC', AllColor.allColors.indexWhere((color) => color == this.color));
          });

          Navigator.pop(context);
          ThemeSwitcher.of(context).switchTheme(ThemeData(
            primaryColor: this.color,
            accentColor: this.color,
            backgroundColor: Theme.of(context).backgroundColor,
            brightness: Theme.of(context).brightness,
          ));
        });
  }
}
