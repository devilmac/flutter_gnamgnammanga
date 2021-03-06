import 'package:flutter/material.dart';
import 'package:flutter_app/src/config/configuration.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/custom/custom_material_ripple.dart';
import 'package:flutter_app/src/ui/detail/detail_manga_arguments.dart';
import 'package:flutter_app/src/ui/detail/detail_manga_widget.dart';

class HomeGridItemWidget extends StatelessWidget {
  final Manga _manga;

  HomeGridItemWidget(this._manga);

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
                        child: _getGridItemImage(_manga.image)),
                  )
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
                ),
              )
            ],
          ),
          Positioned.fill(
            child: MaterialRipple(
              onPressed: () {
                appState.mangaDetail = null;
                appState.isMangaFavorite(_manga.mangaID);
                appState.getMangaDetail(_manga.mangaID, _manga.lastChapterDate);
                _navigateToMangaDetailPage(context);
              },
            ),
          )
        ],
      ),
    );
  }

  _navigateToMangaDetailPage(BuildContext context) {
    Navigator.pushNamed(context, DetailMangaWidget.routeName,
        arguments: DetailMangaArguments(_manga));
  }

  Widget _getGridItemImage(String imageUrl) {
    var widgetImage;

    if (imageUrl != null) {
      widgetImage = FadeInImage.assetNetwork(
          placeholder: IMAGE_PLACEHOLDER, image: imageUrl);
    } else {
      widgetImage = Image.asset(IMAGE_PLACEHOLDER);
    }

    return widgetImage;
  }
}
