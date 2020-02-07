import 'package:flutter/material.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

import 'package:newsy_v2/tabs/Fav.dart';
import 'package:newsy_v2/tabs/Profil.dart';
import 'package:newsy_v2/tabs/Filter.dart';
import 'package:newsy_v2/tabs/News.dart';

class MainScreen extends StatefulWidget {
  var PrimaryColor;

  MainScreen({Key key, @required this.PrimaryColor});
  @override
  MainScreenState createState() => MainScreenState(PrimaryColor: this.PrimaryColor);
}

class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  var PrimaryColor;
  TabController controller;

  MainScreenState({Key key, @required this.PrimaryColor});


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
            color_: PrimaryColor,
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
            labelColor: PrimaryColor,
            unselectedLabelColor: Colors.black),
      ),
    );
  }
}
