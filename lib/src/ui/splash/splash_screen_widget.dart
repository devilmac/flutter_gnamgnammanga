import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/repository/manga_adapter.dart';
import 'package:flutter_app/src/repository/network/manga_network_adapter.dart';
import 'package:flutter_app/src/repository/network/service/mangaeden/mangaeden_service.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/home/home_page_widget.dart';

class SplashScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    fetchManga().then((value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MangaHomePage(title: 'Manga'),
          ),
        ));

    return Center(child: CircularProgressIndicator());
  }

  Future<void> fetchManga() async {
    MangaAdapter adapter = MangaNetworkAdapter(MangaedenService());

    var mangaList = await adapter.getMangaList();

    appState.mangaList = mangaList;
  }
}
