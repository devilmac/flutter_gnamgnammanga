import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'home_grid_item_widget.dart';

class GridMangaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (appState.mangaList != null) {
          if (appState.mangaList.isNotEmpty) {
            var staggeredGrid = StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              mainAxisSpacing: 8.0,
              itemCount: appState.mangaList.length,
              padding: const EdgeInsets.all(16.0),
              crossAxisSpacing: 8.0,
              itemBuilder: (context, index) =>
                  _getItemList(appState.mangaList, index),
              staggeredTileBuilder: (index) => StaggeredTile.fit(2),
            );

            return staggeredGrid;
          } else {
            return _errorOnLoadingManga();
          }
        } else {
          return _errorOnLoadingManga();
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
}
