import 'package:flutter/material.dart';
import 'package:newsy_v2/app/screen/DeleteFilterScreen.dart';
import 'package:newsy_v2/app/tabs/NewAllNews.dart';
import 'package:newsy_v2/app/tabs/NewHeadlines.dart';

class Filter extends StatefulWidget {
  @override
  FilterState createState() => FilterState();
}

class FilterState extends State<Filter> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: AppBar(
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.delete,
                      color: Theme
                          .of(context)
                          .textTheme
                          .body1
                          .color),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => DeleteFilterScreen()));
                  }),
            ],
            title: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Theme
                              .of(context)
                              .primaryColor, width: 3))),
              indicatorColor: Theme
                  .of(context)
                  .primaryColor,
              tabs: <Tab>[
                Tab(
                  child: Text("Actualité"),
                ),
                Tab(
                  child: Text("Tous les articles"),
                ),
              ],
              controller: controller,
              labelColor: Theme
                  .of(context)
                  .primaryColor,
              unselectedLabelColor: Theme
                  .of(context)
                  .textTheme
                  .body1
                  .color,
            ),
            backgroundColor: Theme
                .of(context)
                .backgroundColor,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            NewHeadlines(),
            NewAllNews()
          ],
          controller: controller,
        ));
  }
}

//Theme.of(context).canvasColor
