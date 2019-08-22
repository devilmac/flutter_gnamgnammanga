import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/helper/configuration.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeGridItemWidget extends StatelessWidget {
  HomeGridItemWidget(this._manga);

  final Manga _manga;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
//        _navigateToMovieDetailPage(context);
      },
      child: Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              Stack(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Center(
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: _manga.image != null
                            ? _manga.image
                            : gridImagePlaceholder),
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
                  ))
            ],
          )),
    );
  }

//  _navigateToMovieDetailPage(BuildContext context) {
//    Navigator.push(context,
//        MaterialPageRoute(builder: (context) => MovieDetailWidget(_movie)));
//  }
}
