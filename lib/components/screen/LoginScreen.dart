import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsy_v2/components/screen/MainScreen.dart';
import 'package:newsy_v2/components/screen/SignUpScreen.dart';
import 'package:newsy_v2/config/Constante.dart';
import 'package:newsy_v2/model/User.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLogged = false;
  bool rememberMe = false;
  String password;
  String mail;

  Future<String> connect() async {
    String url = Constante.baseApiUrl +
        '/fr/user/connect?mail=' +
        mail +
        '&password=' +
        password;
    Response response = await post(url);
    if (response.statusCode == 200) {
      return await response.body;
    } else {
      return await response.statusCode.toString();
    }
  }

  void unlogged() {
    debugPrint("10connect");
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
                            Text("Connexion", style: TextStyle(fontSize: 40)),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(labelText: "Mail"),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Veuillez remplir le champs';
                                }
                                RegExp regExp = new RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
                                    caseSensitive: false,
                                    multiLine: false);
                                if (regExp.hasMatch(value)) {
                                  this.mail = value;
                                } else {
                                  return "Mail non conforme";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              cursorColor: Theme.of(context).primaryColor,
                              obscureText: true,
                              decoration:
                                  InputDecoration(labelText: "Mot de passe"),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Veuillez remplir le champs';
                                }
                                RegExp regExp = new RegExp(
                                    r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!#$%&?@])[0-9a-zA-Z!#$%&?@]{8,}$",
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
                                Text("Remember me")
                              ],
                            ),
                            Container(
                              height: 60,
                            ),
                            RaisedButton(
                                color: Theme.of(context).primaryColor,
                                padding: EdgeInsets.all(20),
                                child: Text("Connexion",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white)),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    String retour = await connect();
                                    if (retour != "404") {
                                      var retourJson = jsonDecode(retour);
                                      User.connect(retourJson, rememberMe);

                                      // TODO : faire un module user et faire la lecture du prefs dans le module user avec un check si deja des creds cosntruct du user au debut
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      this.isLogged = true;
                                    } else {}
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
                                'Inscription',
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
