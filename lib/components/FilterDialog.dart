import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterDialog extends StatelessWidget {
  final that;

  FilterDialog({key: Key, this.that});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SimpleDialog(
      title: Text(
        "Choisir un filtre",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      children: <Widget>[
        // default
        ListTile(
          title: Text("Filtre par default",
              style: TextStyle(
                decoration: TextDecoration.underline,
              )),
        ),
        FlatButton(
          child: ListTile(
            title: Text("Filtre default"),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            that.setState(() {
              that.post = that.fetchPost();
              Navigator.pop(context, true);
            });
          },
        ),
        ListTile(
          title: Text("Filtre Custom",
              style: TextStyle(
                decoration: TextDecoration.underline,
              )),
        ),
        //Selected
        FlatButton(
          child: ListTile(
            title: Text(
              "Filtre 1",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
          ),
          onPressed: () {
            that.setState(() {
              that.post = that.fetchPost();
              Navigator.pop(context, true);
            });
          },
          color: Theme.of(context).primaryColor,
        ),

        // Not Selected
        FlatButton(
          child: ListTile(
            title: Text("Filtre 2"),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            that.setState(() {
              that.post = that.fetchPost();
              Navigator.pop(context, true);
            });
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, item) {
            return FlatButton(
              child: ListTile(
                title: Text("Filtre " + item.toString()),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                that.setState(() {
                  that.post = that.fetchPost();
                  Navigator.pop(context, true);
                });
              },
            );
          },
        ),
        FlatButton(
          child: ListTile(
            title: Text("Filtre 3"),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            that.setState(() {
              that.post = that.fetchPost();
              Navigator.pop(context, true);
            });
          },
        ),
        FlatButton(
          child: ListTile(
            title: Text("Filtre 4"),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            that.setState(() {
              that.post = that.fetchPost();
              Navigator.pop(context, true);
            });
          },
        ),
        FlatButton(
          child: ListTile(
            title: Text("Filtre 5"),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            that.setState(() {
              that.post = that.fetchPost();
              Navigator.pop(context, true);
            });
          },
        )
      ],
    );
  }
}
