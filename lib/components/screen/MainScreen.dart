import 'package:flutter/material.dart';

import 'package:newsy_v2/components/tabs/Fav.dart';
import 'package:newsy_v2/components/tabs/Profil.dart';
import 'package:newsy_v2/components/tabs/Filter.dart';
import 'package:newsy_v2/components/tabs/News.dart';

class MainScreen extends StatefulWidget {

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
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
        children: <Widget>[
          News(),
          Filter(),
          Fav(),
          Profil()
        ],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).backgroundColor,
        child: TabBar(
          indicatorColor: Theme.of(context).primaryColor,
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
                  Icons.star,
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
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).textTheme.body1.color
        ),
      ),
    );
  }
}
