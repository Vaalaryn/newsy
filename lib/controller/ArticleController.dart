import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsy_v2/screen/webPageScreen.dart';

class ArticleController {
  var that;

  void setThat(that) {
    this.that = that;
  }

  void animationButton() {
    that.showMore = !that.showMore;
  }

  void launchURL(BuildContext context, data) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WebViewContainer(data)));
  }

  String convertDate(String date) {
    var now = new DateTime.now();
    DateTime dateTime = DateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'").parse(date);
    var deltaTime = now.difference(dateTime).inMinutes;
    String msg;
    if (deltaTime < 60) {
      msg = 'il y a $deltaTime minutes';
    } else if (deltaTime < 720) {
      deltaTime = (deltaTime / 60).floor();
      var s = (deltaTime != 1) ? 's' : '';
      msg = 'il y a $deltaTime heure' + s;
    } else if (deltaTime < 21600) {
      deltaTime = (deltaTime / 1440).floor();
      var s = (deltaTime != 1) ? 's' : '';
      msg = 'il y a $deltaTime jour' + s;
    } else if (deltaTime < 259200) {
      deltaTime = (deltaTime / 43200).floor();
      msg = 'il y a $deltaTime mois';
    } else {
      deltaTime = (deltaTime / 518400).floor();
      var s = (deltaTime != 1) ? 's' : '';
      msg = 'il y a $deltaTime an' + s;
    }
    return msg;
  }
}
