import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsy_v2/components/FilterButton.dart';
import 'package:newsy_v2/generated/l10n.dart';

class FilterDialog extends StatelessWidget {
  final that;

  FilterDialog({key: Key, this.that});

  List<List> _buildFilter = [
    ['/fr/api/newsy?token=RjGoRzoberAVObNnI8A8rR&mail=brice.bitot@neuf.fra&endpoint=top-headlines&params={"country": "fr"}', 'Filtre FR'],
    ['/fr/api/newsy?token=RjGoRzoberAVObNnI8A8rR&mail=brice.bitot@neuf.fra&endpoint=top-headlines&params={"country": "us"}', 'Filtre US']
  ];

  List<Widget> _buildFilterButton(BuildContext context){
    List<Widget> filter = List<Widget>();
    // selected / url / id / nom

    _buildFilter.forEach((data) => {
      filter.add(FilterButton(isSelected: that.actualUrl == data[0],label: data[1],that: that,url: data[0],))
    });

    return filter;
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
        FilterButton(isSelected: that.actualUrl == '/fr/api/newsy?token=RjGoRzoberAVObNnI8A8rR&mail=brice.bitot@neuf.fra&endpoint=top-headlines&params={"country": "jp"}',label: "Filtre default(JP)",that: that,url: '/fr/api/newsy?token=RjGoRzoberAVObNnI8A8rR&mail=brice.bitot@neuf.fra&endpoint=top-headlines&params={"country": "jp"}'),
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
