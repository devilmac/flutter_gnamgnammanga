import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/ui/navigator/app_navigator_impl.dart';

import 'chapter_list_item_widget.dart';

class DetailBodyWidget extends StatelessWidget {
  final String _title;
  final Manga _manga;

  DetailBodyWidget(this._manga, this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _title,
                style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Written: ",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(_manga.author)
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Updated: ",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(DateTime.fromMillisecondsSinceEpoch(
                          _manga.lastChapterDate.toInt() * 1000)
                      .toString())
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: categorieChips(context, _manga.categories)),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(_manga.description)),
              Padding(padding: const EdgeInsets.only(top: 8.0)),
              Row(children: <Widget>[
                Text(
                  "Status: ",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(_manga.status != null ? _manga.status : "Unknown")
              ]),
              Padding(padding: const EdgeInsets.only(top: 8.0)),
              Text(
                "Chapters",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          _manga.chapters != null ? _manga.chapters.length : [],
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ChapterListItemWidget(
                            _manga.chapters != null
                                ? _manga.chapters[index]
                                : [],
                            AppNavigatorImpl());
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  List<Widget> categorieChips(BuildContext context, List<String> categories) {
    return categories.map((element) {
      return Padding(
        padding: const EdgeInsets.only(right: 2.0),
        child: Chip(
          deleteIcon: null,
          clipBehavior: Clip.antiAlias,
          backgroundColor: Theme.of(context).accentColor,
          label: Text(
            element,
//            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }).toList();
  }
}
