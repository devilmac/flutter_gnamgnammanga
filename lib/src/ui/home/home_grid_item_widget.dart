import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/helper/configuration.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/custom/material_ripple.dart';
import 'package:flutter_app/src/ui/detail/detail_manga_widget.dart';
import 'package:flutter_app/src/ui/detail/manga_detail_arguments.dart';

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
                          child: _getGridItemImage(_manga.image)))
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
          Positioned.fill(child: MaterialRipple(
            onPressed: () {
              appState.manga = null;
              appState.getMangaDetail(_manga.mangaID);
              _navigateToMangaDetailPage(context);
            },
          ))
        ],
      ),
    );
  }

  _navigateToMangaDetailPage(BuildContext context) {
    Navigator.pushNamed(context, DetailMangaWidget.routeName,
        arguments:
            MangaDetailArguments(_manga.mangaID, _manga.title, _manga.image));
  }

  Widget _getGridItemImage(String imageUrl) {
    var widgetImage;

    try {
      widgetImage = FadeInImage.assetNetwork(
          placeholder: "placeholder.png",
          image: imageUrl != null ? imageUrl : gridImagePlaceholder);
    } on Exception {
      widgetImage = Image.asset("placeholder.png");
    }

    return widgetImage;
  }
}
