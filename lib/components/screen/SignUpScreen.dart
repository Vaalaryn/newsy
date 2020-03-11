import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final that;

  SignUpScreen(this.that);

  createState() => SignUpScreenState(that);
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final that;

  SignUpScreenState(this.that);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .backgroundColor,
          iconTheme:
          IconThemeData(color: Theme
              .of(context)
              .textTheme
              .body1
              .color),
          bottom: PreferredSize(
              child: Container(
                color: Theme
                    .of(context)
                    .primaryColor,
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
        ),
        body: Container(
            margin: EdgeInsets.fromLTRB(
                MediaQuery
                    .of(context)
                    .size
                    .width * 0.15,
                0,
                MediaQuery
                    .of(context)
                    .size
                    .width * 0.15,
                0),
            width: MediaQuery
                .of(context)
                .size
                .width * 0.7,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text("Inscription", style: TextStyle(fontSize: 40)),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: "Mail"),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Veuillez remplir le champs';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Pseudo"),
                          keyboardType: TextInputType.visiblePassword,
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
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Confirmation du mot de passe"),
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
                            color: Theme
                                .of(context)
                                .primaryColor,
                            padding: EdgeInsets.all(20),
                            child: Text("Inscription",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            onPressed: () {
                              setState(() {
                                this.that.isLoged = true;
                              });
                                  Navigator.pop(context);
                            }),
                      ],
                    ),
                  )
                ])));
  }
}
