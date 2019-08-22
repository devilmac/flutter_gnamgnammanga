import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/repository/manga_adapter.dart';
import 'package:flutter_app/src/repository/network/manga_network_adapter.dart';
import 'package:flutter_app/src/repository/network/service/mangaeden/mangaeden_service.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'home_grid_item_widget.dart';

class GridMangaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    fetchManga();
    return Observer(
      builder: (_) {
        if (appState.mangaList != null && appState.mangaList.isNotEmpty) {
          var staggeredGrid = StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 1.0,
            itemCount: appState.mangaList.length,
            padding: const EdgeInsets.all(4.0),
            crossAxisSpacing: 1.0,
            itemBuilder: (context, index) =>
                _getItemList(appState.mangaList, index),
            staggeredTileBuilder: (index) => StaggeredTile.fit(2),
          );

          return staggeredGrid;
        } else if (appState.mangaList != null && appState.mangaList.isEmpty) {
          return _errorOnLoadingManga();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _errorOnLoadingManga() {
    return SnackBar(
      content: Text("Error on loading manga"),
    );
  }

  Widget _getItemList(List<Manga> movies, int index) {
    Manga manga = movies[index];

    return HomeGridItemWidget(manga);
  }

  Future<void> fetchManga() async {
    MangaAdapter adapter = MangaNetworkAdapter(MangaedenService());

    var mangaList = await adapter.getMangaList();

    appState.mangaList = mangaList;
  }
}
