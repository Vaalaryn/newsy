import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsy_v2/generated/l10n.dart';
import 'package:newsy_v2/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData extends StatefulWidget {
  @override
  createState() => UserDataState();
}

class UserDataState extends State<UserData> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String username;
  String mail;
  var data;
  var fav;
  var read;

  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences prefs) {
      setState(() {
        this.username = User.credUsername;
        this.mail = User.credMail;
//        debugPrint(jsonDecode("{'fav': [1, 2], 'read': [1]}")['fav']);
//        this.fav = data['fav'];
//        this.read = data['read'];
//        debugPrint(this.fav);
//        debugPrint(this.read);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 32, 0, 10),
        child: Column(
          children: <Widget>[
//            CircleAvatar(
//              radius: 89,
//              backgroundColor: Theme.of(context).primaryColor,
//              child: Center(
//                child: CircleAvatar(
//                  radius: 85,
//                  backgroundColor: Theme.of(context).primaryColor,
//                  backgroundImage: NetworkImage(
//                      'https://static.wamiz.fr/images/upload/15876197_1368431473208290_144086124032163840_n(1).jpg'),
//                ),
//              ),
//            ),
            Center(
              child: Text(this.username ?? "username",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
            ),
            Center(
              child: Text(this.mail ?? "mail",
                  style: TextStyle(color: Colors.grey)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Table(children: [
                TableRow(children: [
                  Icon(Icons.check,
                      color: Theme.of(context).primaryColor, size: 30),
                  Icon(Icons.star,
                      color: Theme.of(context).primaryColor, size: 30),
//                  Icon(Icons.alarm_on,
//                      color: Theme.of(context).primaryColor, size: 30),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(this.fav != null ? this.fav.length.toString() : "-1",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(this.read != null ? this.read.length.toString() : "-1",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center),
                  ),
//                  Padding(
//                    padding: EdgeInsets.only(top: 20),
//                    child: Text("5",
//                        style: TextStyle(fontSize: 18),
//                        textAlign: TextAlign.center),
//                  ),
                ])
              ]),
            ),
            ListTile(
              title: Text(S.of(context).profilUpdateUsername),
              trailing: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
            ),
            ListTile(
              title: Text(S.of(context).profilUpdateMail),
              trailing: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
            ),
//            ListTile(
//              title: Text(S.of(context).profilUpdateAvatar),
//              trailing: IconButton(
//                icon: Icon(
//                  Icons.edit,
//                  color: Theme.of(context).primaryColor,
//                ),
//                onPressed: () {},
//              ),
//            ),
            ListTile(
              title: Text(S.of(context).profilUpdatePassword),
              trailing: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
            )
          ],
        ));
  }
}
