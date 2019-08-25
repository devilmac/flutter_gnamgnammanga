import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/helper/configuration.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/detail/detail_manga_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeGridItemWidget extends StatelessWidget {
  HomeGridItemWidget(this._manga);

  final Manga _manga;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Center(
                      child: Hero(
                    tag: _manga.mangaID,
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: _manga.image != null
                            ? _manga.image
                            : gridImagePlaceholder),
                  ))
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      _manga.title,
                      key: Key(_manga.title),
                      textDirection: TextDirection.ltr,
                    ),
                  ))
            ],
          ),
          Positioned.fill(
              child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {
                appState.manga = null;
                _navigateToMangaDetailPage(context, _manga);
              },
            ),
          ))
        ],
      ),
    );
  }

  _navigateToMangaDetailPage(BuildContext context, Manga manga) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return DetailMangaWidget(manga);
    }));
  }
}
