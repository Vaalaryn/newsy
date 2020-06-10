import 'package:flutter/material.dart';
import 'package:newsy_v2/app/model/User.dart';

class DeleteFilterScreen extends StatefulWidget {
  @override
  createState() => DeleteFilterScreenState();
}

class DeleteFilterScreenState extends State<DeleteFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            iconTheme:
                IconThemeData(color: Theme.of(context).textTheme.body1.color),
            bottom: PreferredSize(
                child: Container(
                  color: Theme.of(context).primaryColor,
                  height: 4.0,
                ),
                preferredSize: Size.fromHeight(4.0)),
            actions: <Widget>[]),
        body: ListView.builder(
            itemCount: User.getNumberFilter(),
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(User.getFilter()[index]["name"]),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          User.deleteFilter(index);
                        });
                      }));
            }));
  }
}
