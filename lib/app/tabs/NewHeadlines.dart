import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:newsy_v2/app/model/User.dart';
import 'package:newsy_v2/app/widget/SettingsTitle.dart';
import 'package:newsy_v2/config/Constante.dart';

class NewHeadlines extends StatefulWidget {
  @override
  NewHeadlinesState createState() => NewHeadlinesState();
}

class NewHeadlinesState extends State<NewHeadlines> {
  final _formKey = GlobalKey<FormState>();
  String _filterName = "";
  String _dropValuePays = "";
  String _dropValueCat = "";

//  String _dropValueLang = "";
  String _sources = "";
  List _listSources = [];
  String _keyWord = "";

  List<DropdownMenuItem> filtreBuilder(List listToAdd) {
    List<DropdownMenuItem> _list = List<DropdownMenuItem>();
    listToAdd.forEach((data) {
      _list.add(DropdownMenuItem(
          value: data["value"],
          child: Row(children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(data["name"]),
            )
          ])));
    });
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                SettingsTitle(title: "Création du filtre"),
                TextFormField(
                  initialValue: _keyWord,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(labelText: "Nom du Filtre"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Veuillez selectionner un nom pour le filtre";
                    }
                    _filterName = value;
                    return null;
                  },
                ),
                SettingsTitle(title: "Option du filtre"),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(labelText: "Mot clés"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    _keyWord = value;
                    return null;
                  },
                ),
                ListTile(
                    title: Text("Pays"),
                    trailing: DropdownButton(
                      value: _dropValuePays,
                      items: filtreBuilder(Constante.filterCountry),
                      onChanged: (item) {
                        setState(() {
                          _dropValuePays = item;
                        });
                      },
                    )),
                ListTile(
                    title: Text("Categorie"),
                    trailing: DropdownButton(
                      value: _dropValueCat,
                      items: filtreBuilder(Constante.filterCat),
                      onChanged: (item) {
                        setState(() {
                          _dropValueCat = item;
                        });
                      },
                    )),
                MultiSelectFormField(
                  autovalidate: false,
                  titleText: 'Selections de sources',
                  dataSource: Constante.source,
                  textField: 'name',
                  valueField: 'id',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'RETOUR',
                  hintText: 'Please choose one or more',
                  value: _listSources,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _listSources = value;
                      _sources = value.join(',');
                    });
                  },
                ),
              ],
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("Sauvegarder",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.add, color: Colors.white, size: 40),
                  )),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  if (_filterName != "" &&
                      (_keyWord != "" ||
                          _sources != "" ||
                          _dropValueCat != "" ||
                          _dropValuePays != "")) {

                    var obj = {
                      "name": _filterName,
                      "type": "top-headlines",
                      "params": {
                        "q": _keyWord,
                        "sources": _sources,
                        "category": _dropValueCat,
                        "country": _dropValuePays,
                      }
    };
                    User.addFilter(obj);
                  }else {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Container(
                      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Veuillez selectioner au moins une option"),
                      ),
                    ),
                        backgroundColor: Colors.transparent,
                        elevation: 1000,
                      duration: Duration(milliseconds: 1200)));
                  }
                }
              },
            ),
          ],
        ));
  }
}
