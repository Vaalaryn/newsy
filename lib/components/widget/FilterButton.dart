import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final that;
  bool isSelected;
  String label;
  String url;

  FilterButton({this.that, this.isSelected, this.label, this.url});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(isSelected){
      return FlatButton(
        child: ListTile(
          title: Text(this.label,
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color:Colors.white),
        ),
        onPressed: () {
          that.setState(() {
            that.post = that.fetchPost(url);
            Navigator.pop(context, true);
          });
        },
        color: Theme.of(context).primaryColor,
      );
    }else {
      return FlatButton(
        child: ListTile(
          title: Text(this.label),
          trailing: Icon(Icons.arrow_forward_ios,
              color: Theme.of(context).primaryColor),
        ),
        onPressed: () {
          that.setState(() {
            that.post = that.fetchPost(url);
            Navigator.pop(context, true);
          });
        },
      );
    }
  }
}