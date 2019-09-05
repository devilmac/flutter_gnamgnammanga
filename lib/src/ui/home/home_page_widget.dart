import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/locale/app_localizations.dart';
import 'package:flutter_app/src/preferences/mangaeden/manga_preferences_mangaeden.dart';
import 'package:flutter_app/src/preferences/mangaeden/mangaeden_prefs.dart';
import 'package:flutter_app/src/preferences/mangaeden/mangaeden_prefs_util.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/state/mangaeden/mangaeden_state.dart';
import 'package:flutter_app/src/ui/home/home_grid_manga_favorites_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

    mangaedenState.getSharedPreferences();
    appState.getManga(mangaedenState.selectedLanguage);
    appState.getFavorites(mangaedenState.selectedLanguage);
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
              ),
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
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                openPreferencesBottomSheet(context);
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

  void openPreferencesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).accentColor,
      context: context,
      builder: (_) {
        return Observer(
          builder: (_) {
            MangaPreferencesMangaeden preferencesMangaeden =
                MangaPreferencesMangaeden(mangaedenState.sharedPreferences);

            MangaedenPrefs prefs = preferencesMangaeden.prefs.getValue();

            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Select manga language"),
                        Spacer(),
                        DropdownButton(
                          value: mangaedenState.selectedLanguage,
                          items: languageDropdownMenuItem(context),
                          onChanged: (value) {
                            setState(() {
                              mangaedenState.selectedLanguage = value;
                            });
                            prefs.mangaLanguage = value;
                            preferencesMangaeden.setValue(prefs);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      elevation: 6.0,
    );
  }

  List<DropdownMenuItem> languageDropdownMenuItem(BuildContext context) {
    return LanguageMap(context).mangaEdenLanguage.entries.map((entry) {
      return DropdownMenuItem(
        child: Text(entry.value.name),
        value: entry.value.value,
      );
    }).toList();
  }
}
