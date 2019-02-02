import 'package:flutter/material.dart';
import 'package:flutter_app/home/GridMangaWidget.dart';

class MangaHomePage extends StatelessWidget {
  final String title;

  MangaHomePage.gnamGnamHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text((context.widget as MangaHomePage).title),
        bottom: TabBar(
          tabs: <Widget>[],
        ),
      ),
      body: new GridMangaWidget(),
    );
  }
}
