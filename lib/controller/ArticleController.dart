import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsy_v2/generated/l10n.dart';
import 'package:newsy_v2/screen/WebPageScreen.dart';
import 'package:share/share.dart';

class ArticleController {
  var that;

  void setThat(that) {
    this.that = that;
  }

  void animationButton() {
    that.setState(() {
      that.showMore = !that.showMore;
    });
    if (that.showMore) {
      that.animationController.reverse();
    } else {
      that.animationController.forward();
    }
  }

  void shareButton(context) {
    final RenderBox box = context.findRenderObject();
    Share.share(
        that.data_.url,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
    );
  }

  void favButton(){
    that.setState(() {
      that.fav = !that.fav;
    });
    Scaffold.of(that.context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(that.context).primaryColor,
      duration: Duration(milliseconds: 650),
      content: Text(that.fav
          ? S.of(that.context).snackBarFavoritesSet
          : S.of(that.context).snackBarFavoritesUnset
      ),
    ));
  }

  void pushButton(){
    that.setState(() {
      that.push = !that.push;
    });
    Scaffold.of(that.context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(that.context).primaryColor,
      duration: Duration(milliseconds: 650),
      content: Text(that.push
          ? S.of(that.context).snackBarReminderSet
          : S.of(that.context).snackBarReminderUnset
      ),
    ));
  }

  void launchURL(BuildContext context, data) {
    that.read = true;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WebViewContainer(data)));
  }

  String convertDate(String date) {
    var now = new DateTime.now();
    DateTime dateTime = DateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'").parse(date);
    var deltaTime = now.difference(dateTime).inMinutes;
    String msg;
    // TODO : Message avec i18n
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
