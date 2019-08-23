import 'package:flutter/material.dart';
import 'package:flutter_app/src/resource/resource_string.dart';

import 'grid_manga_widget.dart';
import 'manga_search_delegate.dart';

class MangaHomePage extends StatefulWidget {
  final String title;

  MangaHomePage({Key key, this.title}) : super(key: key);

  @override
  MangaHomePageState createState() {
    return new MangaHomePageState();
  }
}

class MangaHomePageState extends State<MangaHomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> mangaTabs = <Tab>[
    Tab(text: TAB_MANGA),
    Tab(text: TAB_FAVORITES),
  ];

  TabController _mangaTabController;

  @override
  void initState() {
    super.initState();
    _mangaTabController = TabController(vsync: this, length: mangaTabs.length);
  }

  @override
  void dispose() {
    _mangaTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MangaSearchDelegate());
            },
          )
        ],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text((context.widget as MangaHomePage).title),
        bottom: TabBar(
          tabs: mangaTabs,
          controller: _mangaTabController,
        ),
      ),
      body: TabBarView(
        controller: _mangaTabController,
        children: [GridMangaWidget(), Center(child: Text(TAB_FAVORITES))],
      ),
    );
  }
}
