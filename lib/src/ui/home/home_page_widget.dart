import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/locale/app_localizations.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/home/home_grid_manga_favorites_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_grid_manga_widget.dart';
import 'home_manga_search_delegate.dart';

class MangaHomePage extends StatefulWidget {
  final String title;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MangaHomePage({Key key, this.title}) : super(key: key);

  @override
  MangaHomePageState createState() {
    return new MangaHomePageState();
  }
}

class MangaHomePageState extends State<MangaHomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    appState.getManga();
    appState.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final List<Tab> mangaTabs = <Tab>[
      Tab(text: AppLocalizations.of(context).tabAllManga),
      Tab(text: AppLocalizations.of(context).tabFavoritesManga),
    ];

    return DefaultTabController(
      length: mangaTabs.length,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Container(),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Accedi con Google"),
              )
            ],
          ),
        ),
        appBar: AppBar(
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
          ),
        ),
        body: TabBarView(
          children: [GridMangaWidget(), GridMangaFavoritesWidget()],
        ),
      ),
    );
  }
}
