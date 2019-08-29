import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/navigator/app_navigator_impl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'home_grid_item_widget.dart';

class GridMangaFavoritesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (appState.favoriteMangaList != null &&
            appState.favoriteMangaList.isNotEmpty) {
          var staggeredGrid = StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 1.0,
            itemCount: appState.favoriteMangaList.length,
            padding: const EdgeInsets.all(4.0),
            crossAxisSpacing: 1.0,
            itemBuilder: (context, index) =>
                _getItemList(appState.favoriteMangaList, index),
            staggeredTileBuilder: (index) => StaggeredTile.fit(2),
          );

          return staggeredGrid;
        } else if (appState.favoriteMangaList != null &&
            appState.favoriteMangaList.isEmpty) {
          return _errorOnLoadingManga();
        } else {
          return Center(
              child: Text("No yet manga! Add your favorite manga here!"));
        }
      },
    );
  }

  Widget _errorOnLoadingManga() {
    return SnackBar(
      content: Text("Error on loading manga"),
    );
  }

  Widget _getItemList(List<Manga> manga, int index) =>
      HomeGridItemWidget(manga[index], AppNavigatorImpl());
}
