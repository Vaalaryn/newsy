import 'package:flutter/cupertino.dart';
import 'package:newsy_v2/components/screen/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  static Future<bool> check() {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    return _prefs.then((SharedPreferences prefs) {
      if (prefs.containsKey('username') &&
          prefs.containsKey('data') &&
          prefs.containsKey('mail') &&
          prefs.containsKey('token')) {
        debugPrint("Je remember");
        _credData = prefs.getString('data');
        _credMail = prefs.getString('mail');
        _credUsername = prefs.getString('username');
        _credToken = prefs.getString('token');
        return true;
      } else {
        debugPrint("Je remember pas");
        return false;
      }
    });
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
    if (rememberMe) {
      _prefs.setString('username', json['username']);
      _prefs.setString('mail', json['mail']);
      _prefs.setString('token', json['token']);
      _prefs.setString('data', json['data']);
    }
  }

  static disconnect(){
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
      thatLoginPage.unlogged();
    });
  }
}
