import 'package:flutter/material.dart';
import 'package:newsy_v2/screen/mainScreen.dart';

var _PrimaryColor = Color.fromRGBO(255, 99, 71, 1);
var _AccentColor = Color.fromRGBO(255, 99, 71, 1);
var _BackgroundColor = Color.fromRGBO(255, 99, 71, 1);
var _TextColor = Color.fromRGBO(255, 99, 71, 1);

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(PrimaryColor: Color.fromRGBO(255, 99, 71, 1)),
    // TODO : Theme propre
    theme: ThemeData(
        primaryColor: _PrimaryColor,
        accentColor: _AccentColor,
        backgroundColor: _BackgroundColor,
        textTheme: TextTheme(
          body1: TextStyle(color: _TextColor)
        )
//      splashColor:
    ),
  ));
}