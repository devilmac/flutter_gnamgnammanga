import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/ui/custom/material_ripple.dart';

class ChapterListItemWidget extends StatelessWidget {
  final Chapter _chapter;

  ChapterListItemWidget(this._chapter);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Center(
                        child: Hero(
                            tag: _chapter.chapterID,
                            child: Image.asset(
                              "assets/chapter_placeholder.png",
                              fit: BoxFit.cover,
                            )))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Chapter " + _chapter.number,
                ),
              )
            ],
          ),
          Positioned.fill(
              child: MaterialRipple(
            onPressed: () {},
          ))
        ],
      ),
    ));
  }

//  Future<List<ChapterImage>> _fetchChapterDetail(String chapterID) {
//    MangaAdapter adapter = MangaNetworkAdapter(MangaedenService());
//
//    return adapter.getChapterDetail(chapterID);
//  }

//  Widget _getChapterItemImage(String imageUrl) {
//    return Image.asset("chapter_placeholder.jpg");
//  }
}
