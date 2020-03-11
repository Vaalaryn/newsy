import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsy_v2/generated/l10n.dart';
import 'package:newsy_v2/components/screen/WebPageScreen.dart';
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
    // TODO : SEMAINE ?
    if (deltaTime < 60) {
      msg = deltaTime > 1 ? S.of(that.context).articleDateInMinutes(deltaTime) : S.of(that.context).articleDateInMinute(deltaTime);
    } else if (deltaTime < 1440) {
      deltaTime = (deltaTime / 60).floor();
      msg = deltaTime > 1 ? S.of(that.context).articleDateInHours(deltaTime) : S.of(that.context).articleDateInHour(deltaTime);
    } else if (deltaTime < 43200) {
      deltaTime = (deltaTime / 1440).floor();
      msg = deltaTime > 1 ? S.of(that.context).articleDateInDays(deltaTime) : S.of(that.context).articleDateInDay(deltaTime);
    } else if (deltaTime < 525601) {
      deltaTime = (deltaTime / 43200).floor();
      msg = deltaTime > 1 ? S.of(that.context).articleDateInMonths(deltaTime) : S.of(that.context).articleDateInMonth(deltaTime);
    } else {
      deltaTime = (deltaTime / 525601).floor();
      msg = deltaTime > 1 ? S.of(that.context).articleDateInYears(deltaTime) : S.of(that.context).articleDateInYear(deltaTime);
    }
    return msg;
  }
}
