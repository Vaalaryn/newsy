import 'package:flutter/material.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

import 'package:newsy/tabs/Fav.dart';
import 'package:newsy/tabs/Profil.dart';
import 'package:newsy/tabs/Filter.dart';
import 'package:newsy/tabs/News.dart';

var _PrimaryColor = Color.fromRGBO(255, 99, 71, 1);

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
    theme: ThemeData(
    accentColor: _PrimaryColor,
  ),
  ));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarManager.setStyle(StatusBarStyle.DARK_CONTENT);
    FlutterStatusbarManager.setColor(Colors.white, animated: true);
    FlutterStatusbarManager.setNavigationBarColor(Colors.white, animated: true);

    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          News(
            color_: _PrimaryColor,
          ),
          Fav(),
          Filter(),
          Profil()
        ],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        child: TabBar(
            tabs: <Tab>[
              Tab(
                  icon: Icon(
                    Icons.library_books,
                    size: 25,
                  )),
              Tab(
                icon: Icon(
                  Icons.search,
                  size: 25,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.add,
                  size: 25,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                  size: 25,
                ),
              ),
            ],
            controller: controller,
            labelColor: _PrimaryColor,
            unselectedLabelColor: Colors.black),
      ),
    );
  }
}
