import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MangaChapterSwiper extends StatelessWidget {
  final List<Chapter> _chapters;

  MangaChapterSwiper(this._chapters);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints.loose(Size.fromHeight(304)),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              clipBehavior: Clip.antiAlias,
              elevation: 4,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: <Color>[Colors.indigo, Colors.indigoAccent],
                  ),
                ),
                child: Center(child: Text(_chapters[index].title)),
              ),
            );
          },
          index: 0,
          loop: true,
          itemWidth: 304,
          itemHeight: 304,
          layout: SwiperLayout.DEFAULT,
          itemCount: _chapters.length,
          viewportFraction: 0.5,
          scrollDirection: Axis.horizontal,
          scale: 0.5,
        ));
  }
}
