import 'package:flutter/material.dart';

import 'package:newsy/tabs/Fav.dart';
import 'package:newsy/tabs/Profil.dart';
import 'package:newsy/tabs/Filter.dart';
import 'package:newsy/tabs/News.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
    theme: ThemeData(
      primarySwatch: Colors.red,
      accentColor: Colors.redAccent,
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
    return Scaffold(
      body: TabBarView(
        children: <Widget>[News(), Fav(), Filter(), Profil()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        child: TabBar(
            tabs: <Tab>[
              Tab(
                  icon: Icon(
                    Icons.library_books,
                  )),
              Tab(
                icon: Icon(
                  Icons.search,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.add,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                ),
              ),
            ],
            controller: controller,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black
        ),
      ),
    );
  }
}
