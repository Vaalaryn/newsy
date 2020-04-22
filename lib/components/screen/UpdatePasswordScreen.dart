import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsy_v2/config/Constante.dart';
import 'package:newsy_v2/model/User.dart';

class UpdatePasswordScreen extends StatefulWidget {
  createState() => UpdatePasswordState();
}

class UpdatePasswordState extends State<UpdatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String password;
  String newPassword;
  String newPasswordConf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).textTheme.body1.color),
          title: Text("Modification du mot de passe",
              style: TextStyle(color: Theme.of(context).textTheme.body1.color)),
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: "Mot de passe actuel"),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Veuillez remplir le champs';
                              }
                              RegExp regExp = new RegExp(
                                  Constante.regexPassword,
                                  caseSensitive: true,
                                  multiLine: false);
                              if (regExp.hasMatch(value)) {
                                this.password = value;
                              } else {
                                return "Mot de passe non conforme";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            obscureText: false,
                            decoration: InputDecoration(
                                labelText: "Nouveau mot de passe"),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Veuillez remplir le champs';
                              }
                              RegExp regExp = new RegExp(
                                  Constante.regexPassword,
                                  caseSensitive: true,
                                  multiLine: false);
                              if (regExp.hasMatch(value)) {
                                this.newPassword = value;
                              } else {
                                return "Mot de passe non conforme";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            obscureText: false,
                            decoration: InputDecoration(
                                labelText:
                                    "Confirmation du nouveau mot de passe"),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Veuillez remplir le champs';
                              }
                              RegExp regExp = new RegExp(
                                  Constante.regexPassword,
                                  caseSensitive: true,
                                  multiLine: false);
                              if (this.newPassword != value) {
                                return "Les mots de passe ne correspondent pas";
                              } else if (regExp.hasMatch(value)) {
                                this.newPasswordConf = value;
                              } else {
                                return "Confirmation de mot de passe non conforme";
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
                              child: Text("Modifier",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white)),
                              onPressed: () async {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                if (_formKey.currentState.validate()) {
                                  String retour = await User.updateUserData(this.password, {"password": this.newPassword, "password_confirm": this.newPasswordConf});
                                  if (retour == "302") {
                                    Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                            Theme.of(context)
                                                .primaryColor,
                                            duration:
                                            Duration(milliseconds: 850),
                                            content:
                                            Text("Mauvais mot de passe")));
                                  } else if (retour != "404") {
                                    Duration time =
                                    new Duration(milliseconds: 500);
                                    Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                            Theme.of(context)
                                                .primaryColor,
                                            duration: time,
                                            content:
                                            Text("Changement de mot de passe réussi")));
                                    Timer(time, () {
                                      Navigator.pop(context);
                                    });
                                  }
                                }
                              }),
                        ],
                      ),
                    )
                  ]),
            );
          },
        ));
  }
}
