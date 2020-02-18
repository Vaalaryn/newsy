import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                    child: Text("Connexion", style: TextStyle(fontSize: 40)),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: "Mail"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Veuillez remplir le champs';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration:
                              InputDecoration(labelText: "Mot de passe"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Veuillez remplir le champs';
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
                            child: Text("Connexion",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            onPressed: () {
                              // Validate returns true if the form is valid, otherwise false.
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.

                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            })
                      ],
                    ),
                  )
                ])));
  }
}
