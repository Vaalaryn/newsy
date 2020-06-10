import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsy_v2/app/screen/LoginScreen.dart';
import 'package:newsy_v2/config/Constante.dart';
import 'package:newsy_v2/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  static List<dynamic> articleFavoris = new List<dynamic>();
  static List<dynamic> articleLu = new List<dynamic>();
  static List<dynamic> filter = new List<dynamic>();
  static bool ThemeB = Constante.defaultThemeBrightness;
  static int ThemeC = Constante.defaultThemeColor;
  static String Lang = Constante.defaultLang;

  static addToFav(String article) {
    articleFavoris.add(article);
    updateData();
  }

  static int getNumberFav() {
    return articleFavoris.length;
  }

  static deleteToFav(String article) {
    articleFavoris.removeWhere((item) => item == article);
    updateData();
  }

  static bool checkIfFavExist(String article) {
    return articleFavoris.indexOf(article) != -1;
  }

  static bool checkIfLuExist(String article) {
    return articleLu.indexOf(article) != -1;
  }

  static addToLu(String article) {
    articleLu.add(article);
    updateData();
  }

  static int getNumberLu() {
    return articleLu.length;
  }

  static deleteToLu(String article) {
    articleFavoris.removeWhere((item) => item == article);
    updateData();
  }

  static List<dynamic> getFilter(){
    return filter;
  }

  static int getNumberFilter(){
    return filter.length;
  }

  static void addFilter(Object el){
    filter.add(el);
    updateData();
  }

  static void deleteFilter(int index){
    filter.removeAt(index);
    updateData();
  }

  static void setLang(String lang) {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((prefs) {
      prefs.setString('lang', lang);
    });
    Lang = lang;
    updateData();
  }

  static void setThemeB(bool brightness) {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((prefs) {
      prefs.setBool('themeB', brightness);
    });
    ThemeB = brightness;
    updateData();
  }

  static void setThemeC(int color) {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((prefs) {
      prefs.setInt('themeC', color);
    });
    ThemeC = color;
    updateData();
  }


  static LoginScreenState thatLoginPage;

  static String _credMail;

  static String get credMail => _credMail;

  static String _credToken;

  static String get credToken => _credToken;

  static String _credUsername;

  static String get credUsername => _credUsername;

  static String _credData;

  static String get credData => _credData;

  static connect(var json, bool rememberMe) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _credData = json['data'];
    _credMail = json['mail'];
    _credUsername = json['username'];
    _credToken = json['token'];
    articleFavoris = jsonDecode(_credData)["fav"];
    articleLu = jsonDecode(_credData)["lu"];
    filter = jsonDecode(_credData)["filter"];
    setThemeB(jsonDecode(_credData)["settings"]["themeB"]);
    setThemeC(jsonDecode(_credData)["settings"]["themeC"]);
    setLang(jsonDecode(_credData)["settings"]["lang"]);
    if (rememberMe) {
      _prefs.setString('username', json['username']);
      _prefs.setString('mail', json['mail']);
      _prefs.setString('token', json['token']);
      _prefs.setString('data', json['data']);
    }
  }

  static Future<bool> check() {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    return _prefs.then((SharedPreferences prefs) {
      if (prefs.containsKey('username') &&
          prefs.containsKey('data') &&
          prefs.containsKey('mail') &&
          prefs.containsKey('token')) {
        _credData = prefs.getString('data');
        _credMail = prefs.getString('mail');
        _credUsername = prefs.getString('username');
        _credToken = prefs.getString('token');
        articleFavoris = jsonDecode(prefs.getString('data'))["fav"];
        articleLu = jsonDecode(prefs.getString('data'))["lu"];
        filter = jsonDecode(prefs.getString('data'))["filter"];
        if(prefs.containsKey('lang')){
          setLang(prefs.getString('lang'));
        }
        if(prefs.containsKey('themeB')){
          setThemeB(prefs.getBool('themeB'));
        }
        if(prefs.containsKey('themeC')){
          setThemeC(prefs.getInt('themeC'));
        }
        S.load(Locale(User.Lang, ''));
        return true;
      } else {
        return false;
      }
    });
  }

  static disconnect() {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((prefs) {
      _credMail = null;
      _credUsername = null;
      _credToken = null;
      _credData = null;
      prefs.remove('username');
      prefs.remove('data');
      prefs.remove('token');
      prefs.remove('mail');
      prefs.remove('lang');
      prefs.remove('themeB');
      prefs.remove('themeC');
      articleFavoris = new List<dynamic>();
      articleLu = new List<dynamic>();
      filter = new List<dynamic>();
      thatLoginPage.unlogged();
    });
  }

  static updateData() async {
    Object json = {
      "fav": articleFavoris,
      "lu": articleLu,
      "filter": filter,
      "settings": {"lang": Lang, "themeC": ThemeC, "themeB": ThemeB}
    };
    String data = jsonEncode(json);
    _credData = data;
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((prefs) {
      prefs.setString('data', data);
    });
    String url = Constante.baseApiUrl + '/fr/user/updateData';
    Map<String, String> headers = {"Content-type": "application/json"};
    json = {
      "mail": _credMail,
      "token": _credToken,
      "data": _credData,
    };
    Response response =
    await post(url, headers: headers, body: jsonEncode(json));
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return await response.body;
    } else {
      return await response.statusCode.toString();
    }
  }

  static Future<String> updateUserData(String password,Object data) async {
    String url = Constante.baseApiUrl + '/fr/user/update';
    Map<String, String> headers = {"Content-type": "application/json"};
    Object json = {
      "mail": credMail,
      "token": credToken,
      "password": password,
      "field_to_update": data
    };
    Response response =
    await post(url, headers: headers, body: jsonEncode(json));
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return await response.body;
    } else {
      return await response.statusCode.toString();
    }
  }

}
