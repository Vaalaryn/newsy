import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsy_v2/generated/l10n.dart';

class UserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 32, 0, 10),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 89,
              backgroundColor: Theme.of(context).primaryColor,
              child: Center(
                child: CircleAvatar(
                  radius: 85,
                  backgroundImage: NetworkImage(
                      'https://static.wamiz.fr/images/upload/15876197_1368431473208290_144086124032163840_n(1).jpg'),
                ),
              ),
            ),
            Center(
              child: Text("Username",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
            ),
            Center(
              child: Text("Mail.mail@orange.fr",
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
                  Icon(Icons.alarm_on,
                      color: Theme.of(context).primaryColor, size: 30),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("50",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("15",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("5",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center),
                  ),
                ])
              ]),
            ),
            // TODO Changement info
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
            ListTile(
              title: Text(S.of(context).profilUpdateAvatar),
              trailing: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
            ),
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
