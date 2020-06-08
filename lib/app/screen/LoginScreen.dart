import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsy_v2/app/screen/MainScreen.dart';
import 'package:newsy_v2/app/screen/SignUpScreen.dart';
import 'package:newsy_v2/config/Constante.dart';
import 'package:newsy_v2/generated/l10n.dart';
import 'package:newsy_v2/app/model/User.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLogged = false;
  bool rememberMe = false;
  String password;
  String mail;

  Future<String> connect(String mail, String password) async {
    String url = Constante.baseApiUrl + '/fr/user/connect';
    Map<String, String> headers = {"Content-type": "application/json"};
    Object json = {
      "mail": mail,
      "password": password,
    };
    Response response =
        await post(url, headers: headers, body: jsonEncode(json));
    if (response.statusCode == 200) {
      return await response.body;
    } else {
      return await response.statusCode.toString();
    }
  }

  void unlogged() {
    setState(() {
      isLogged = false;
    });
  }

  @override
  void initState() {
    User.thatLoginPage = this;
    User.check().then((isRemember) {
      setState(() {
        isLogged = isRemember;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLogged
        ? MainScreen()
        : Scaffold(
            body: Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.15,
                    0,
                    MediaQuery.of(context).size.width * 0.15,
                    0),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child:
                            Text(S.of(context).connexionTitle, style: TextStyle(fontSize: 40)),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(labelText: S.of(context).connexionLabelMail),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return S.of(context).inscriptionMsgFieldsEmpty;
                                }
                                RegExp regExp = new RegExp(Constante.regexMail,
                                    caseSensitive: false, multiLine: false);
                                if (regExp.hasMatch(value)) {
                                  this.mail = value;
                                } else {
                                  return S.of(context).connexionMsgWrongMail;
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              cursorColor: Theme.of(context).primaryColor,
                              obscureText: true,
                              decoration:
                                  InputDecoration(labelText: S.of(context).connexionLabelPassword),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return S.of(context).inscriptionMsgFieldsEmpty;
                                }
                                RegExp regExp = new RegExp(
                                    Constante.regexPassword,
                                    caseSensitive: true,
                                    multiLine: false);
                                if (regExp.hasMatch(value)) {
                                  this.password = value;
                                } else {
                                  return S.of(context).connexionMsgWrongPassword;
                                }
                                return null;
                              },
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value;
                                    });
                                  },
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text(S.of(context).connexionLabelRememberMe)
                              ],
                            ),
                            Container(
                              height: 60,
                            ),
                            RaisedButton(
                                color: Theme.of(context).primaryColor,
                                padding: EdgeInsets.all(20),
                                child: Text(S.of(context).connexionLabelButtonConnexion,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white)),
                                onPressed: () async {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  if (_formKey.currentState.validate()) {
                                    String retour =
                                        await connect(this.mail, this.password);
                                    debugPrint(retour);
                                    if (retour != "404" && retour != "302") {
                                      var retourJson = jsonDecode(retour);
                                      User.connect(retourJson, rememberMe);
//                                      ThemeSwitcher.of(context).switchTheme(ThemeData(
//                                        primaryColor: AllColor.allColors[User.ThemeC],
//                                        accentColor: AllColor.allColors[User.ThemeC],
//                                        backgroundColor: User.ThemeB ? AllColor.backgroundColor[0] : AllColor.backgroundColor[1],
//                                        brightness: User.ThemeB ? Brightness.dark : Brightness.light,
//                                      ));
                                      setState(() {
                                        this.isLogged = true;
                                      });
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                content: Text(
                                                    S.of(context).connexionMsgConnectionError),
                                                actions: <Widget>[
                                                  FlatButton(
                                                      child: Text(S.of(context).connexionCloseError),
                                                      onPressed: () => Navigator.pop(context))
                                                ],
                                              ));
                                    }
                                  }
                                }),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignUpScreen(this)));
                              },
                              child: Text(
                                S.of(context).connexionLabelGoToInscription,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                      )
                    ])));
  }
}
