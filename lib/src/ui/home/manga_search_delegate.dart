import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'home_grid_item_widget.dart';

class MangaSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    var mangaList = appState.mangaList;

    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

//    Pattern searchPattern = RegExp("(\w+)", caseSensitive: false);

    var searchResult =
        mangaList.where((element) => element.title.contains(query)).toList();

    if (searchResult.isNotEmpty) {
      return StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          mainAxisSpacing: 1.0,
          itemCount: searchResult.length,
          padding: const EdgeInsets.all(4.0),
          crossAxisSpacing: 1.0,
          itemBuilder: (context, index) => _getItemList(searchResult, index),
          staggeredTileBuilder: (index) => StaggeredTile.fit(2));
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "No item found with the given query",
            ),
          )
        ],
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }

  Widget _getItemList(List<Manga> movies, int index) {
    Manga manga = movies[index];

    return HomeGridItemWidget(manga);
  }
}
