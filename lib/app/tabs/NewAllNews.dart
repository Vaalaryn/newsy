import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:newsy_v2/app/model/User.dart';
import 'package:newsy_v2/app/widget/SettingsTitle.dart';
import 'package:newsy_v2/config/Constante.dart';

class NewAllNews extends StatefulWidget {
  @override
  NewAllNewsState createState() => NewAllNewsState();
}

class NewAllNewsState extends State<NewAllNews> {
  final _formKey = GlobalKey<FormState>();
  String _filterName = "";
  String _dropValueLang = "";
  String _dropValueSort = "";
  DateTime _fromDate = null;
  DateTime _toDate = null;

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
            Column(children: <Widget>[
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
                  title: Text("Langue"),
                  trailing: DropdownButton(
                    value: _dropValueLang,
                    items: filtreBuilder(Constante.filterLanguage),
                    onChanged: (item) {
                      setState(() {
                        _dropValueLang = item;
                      });
                    },
                  )),
              ListTile(
                  title: Text("Tri"),
                  trailing: DropdownButton(
                    value: _dropValueSort,
                    items: filtreBuilder(Constante.filterSort),
                    onChanged: (item) {
                      setState(() {
                        _dropValueSort = item;
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
                hintText: 'Selectionner une ou plusieurs source',
                value: _listSources,
                onSaved: (value) {
                  if (value == null) return;
                  setState(() {
                    _listSources = value;
                    _sources = value.join(',');
                  });
                },
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                          padding: EdgeInsets.all(15),
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                maxTime: DateTime(DateTime.now().year,
                                    DateTime.now().month, DateTime.now().day),
                                theme: DatePickerTheme(
                                    headerColor:
                                        Theme.of(context).backgroundColor,
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                    cancelStyle: TextStyle(
                                        color: Theme.of(context).textTheme.body1.color),
                                    itemStyle: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .color,
                                        fontWeight: FontWeight.bold),
                                    doneStyle: TextStyle(
                                        color: Theme.of(context).primaryColor)),
                                onConfirm: (date) {
                                  setState(() {
                                    _fromDate = date;
                                  });
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.fr);
                          },
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Depuis",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                      _fromDate == null
                                          ? 'Aucune date choisie'
                                          : DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(_fromDate),
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              Icon(
                                Icons.date_range,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          )),
                      FlatButton(
                          padding: EdgeInsets.all(15),
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                maxTime: DateTime(DateTime.now().year,
                                    DateTime.now().month, DateTime.now().day),
                                theme: DatePickerTheme(
                                    headerColor:
                                        Theme.of(context).backgroundColor,
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                    cancelStyle: TextStyle(
                                        color: Theme.of(context).textTheme.body1.color),
                                    itemStyle: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .color,
                                        fontWeight: FontWeight.bold),
                                    doneStyle: TextStyle(
                                        color: Theme.of(context).primaryColor)),
                                onConfirm: (date) {
                              setState(() {
                                _toDate = date;
                              });
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.fr);
                          },
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Jusqu'à",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                      _toDate == null
                                          ? 'Aucune date choisie'
                                          : DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(_toDate),
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              Icon(
                                Icons.date_range,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ))
                    ],
                  ))
            ]),
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
                          _dropValueLang != ""||
                          _dropValueSort != ""||
                          _fromDate != null||
                          _toDate != null)) {
                    var obj = {
                      "name": _filterName,
                      "type": "everything",
                      "params": {
                        "q": _keyWord,
                        "sources": _sources,
                        "language": _dropValueLang,
                        "sortBy": _dropValueSort,
                        "from": _fromDate == null ? "" : _fromDate.toIso8601String(),
                        "to": _toDate == null ? "" : _toDate.toIso8601String(),
                        "pageSize": 100
                      }
                    };
                    User.addFilter(obj);
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Filtre sauvegardé"),
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 1000,
                        duration: Duration(milliseconds: 1200)));
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Veuillez selectioner au moins une option"),
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
