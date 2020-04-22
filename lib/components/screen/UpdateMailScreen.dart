import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsy_v2/config/Constante.dart';
import 'package:newsy_v2/model/User.dart';

class UpdateMailScreen extends StatefulWidget {
  createState() => UpdateMailState();
}

class UpdateMailState extends State<UpdateMailScreen> {
  final _formKey = GlobalKey<FormState>();

  String password;
  String newMail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).textTheme.body1.color),
          title: Text("Modification du mail",
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
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                labelText: "Mot de passe"),
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
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: "Nouveau mail"),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Veuillez remplir le champs';
                              }
                              RegExp regExp = new RegExp(
                                  Constante.regexMail,
                                  caseSensitive: true,
                                  multiLine: false);
                              if (regExp.hasMatch(value)) {
                                this.newMail = value;
                              } else {
                                return "Mail non conforme";
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
                                  String retour = await User.updateUserData(this.password, {"mail": this.newMail});
                                  if (retour == "302") {
                                    Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                            Theme.of(context)
                                                .primaryColor,
                                            duration:
                                            Duration(milliseconds: 850),
                                            content:
                                            Text("Mail non conforme")));
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
                                            Text("Changement de mail réussi")));
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
