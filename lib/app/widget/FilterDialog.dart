import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsy_v2/app/widget/FilterButton.dart';
import 'package:newsy_v2/generated/l10n.dart';
import 'package:newsy_v2/app/model/User.dart';

class FilterDialog extends StatelessWidget {
  final that;

  FilterDialog({key: Key, this.that});

  List<Widget> _buildFilterButton(BuildContext context){
    List<Widget> filter = List<Widget>();

    User.filter.forEach((data) {
      filter.add(FilterButton(isSelected: that.actualUrl == buildUrl(data["type"], data["params"]),label: data["name"],that: that,url: buildUrl(data["type"], data["params"]),));
    });

    return filter;
  }

  // même nom de param que l'api
  String buildUrl(String type, Object params){
    return '/fr/api/newsy?token=' + User.credToken + '&mail=' + User.credMail + '&endpoint=' + type + '&params=' + jsonEncode(params);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        S.of(context).filterSelect,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      children: <Widget>[
        // default
        ListTile(
          title: Text(S.of(context).filterDefault,
              style: TextStyle(
                decoration: TextDecoration.underline,
              )),
        ),
        FilterButton(isSelected: that.actualUrl == '/fr/api/newsy?token=' + User.credToken + '&mail=' + User.credMail + '&endpoint=top-headlines&params={"country": "fr"}',label: "Filtre par default(FR)",that: that,url: '/fr/api/newsy?token=' + User.credToken + '&mail=' + User.credMail + '&endpoint=top-headlines&params={"country": "fr"}'),
        ListTile(
          title: Text(S.of(context).filterCustom,
              style: TextStyle(
                decoration: TextDecoration.underline,
              )),
        ),
        ..._buildFilterButton(context)
      ],
    );
  }
}
