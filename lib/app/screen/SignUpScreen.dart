import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsy_v2/config/Constante.dart';
import 'package:newsy_v2/generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  final that;

  SignUpScreen(this.that);

  createState() => SignUpScreenState(that);
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final that;
  String mail;
  String username;
  String password;
  String password_confirm;

  Future<String> inscription() async {
    String url = Constante.baseApiUrl + '/fr/user/add';
    Map<String, String> headers = {"Content-type": "application/json"};
    Object json = {
      "username": username,
      "mail": mail,
      "password": password,
      "password_confirm": password_confirm,
    };
    Response response =
        await post(url, headers: headers, body: jsonEncode(json));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return await response.body;
    } else {
      return await response.statusCode.toString();
    }
  }

  SignUpScreenState(this.that);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          bottom: PreferredSize(
              child: Container(
                color: Theme.of(context).primaryColor,
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Container(
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
                            Text(S.of(context).inscriptionTitle, style: TextStyle(fontSize: 40)),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(labelText: S.of(context).inscriptionLabelMail),
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
                                  return S.of(context).inscriptionMsgWrongMail;
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: S.of(context).inscriptionLabelPseudo),
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return S.of(context).inscriptionMsgFieldsEmpty;
                                }
                                RegExp regExp = new RegExp(
                                    Constante.regexUsername,
                                    caseSensitive: true,
                                    multiLine: false);
                                if (regExp.hasMatch(value)) {
                                  this.username = value;
                                } else {
                                  return S.of(context).inscriptionMsgWrongPseudo;
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration:
                                  InputDecoration(labelText: S.of(context).inscriptionLabelMdp),
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
                                  return S.of(context).inscriptionMsgWrongPassword;
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: S.of(context).inscriptionLabelConfPassword),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return S.of(context).inscriptionMsgFieldsEmpty;
                                }
                                RegExp regExp = new RegExp(
                                    Constante.regexPassword,
                                    caseSensitive: true,
                                    multiLine: false);
                                if (this.password != value) {
                                  return S.of(context).inscriptionMsgMdpNoMatch;
                                } else if (regExp.hasMatch(value)) {
                                  this.password_confirm = value;
                                } else {
                                  return S.of(context).inscriptionMsgWrongConfPassword;
                                }
                                return null;
                              },
                            ),
                            Container(
                              height: 60,
                            ),
                            RaisedButton(
                                color: Theme.of(context).primaryColor,
                                padding: EdgeInsets.all(20),
                                child: Text(S.of(context).inscriptionButtonValidation,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white)),
                                onPressed: () async {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  if (_formKey.currentState.validate()) {
                                    String retour = await inscription();
                                    if (retour == "302") {
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              backgroundColor:
                                                  Theme.of(that.context)
                                                      .primaryColor,
                                              duration:
                                                  Duration(milliseconds: 850),
                                              content:
                                                  Text(S.of(context).inscriptionMailAlreadyUsed)));
                                    } else if (retour != "404") {
                                      Duration time =
                                          new Duration(milliseconds: 500);
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              backgroundColor:
                                                  Theme.of(that.context)
                                                      .primaryColor,
                                              duration: time,
                                              content:
                                                  Text(S.of(context).inscriptionSuccess)));
                                      Timer(time, () {
                                        Navigator.pop(context);
                                      });
                                    }
                                  }
                                }),
                          ],
                        ),
                      )
                    ]));
          },
        ));
  }
}
