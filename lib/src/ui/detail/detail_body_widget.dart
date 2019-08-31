import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/locale/app_localizations.dart';

import 'chapter_list_item_widget.dart';

class DetailBodyWidget extends StatelessWidget {
  final String _title;
  final MangaDetail _mangaDetail;

  DetailBodyWidget(this._title, this._mangaDetail);

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
                    AppLocalizations.of(context).detailAuthor + " ",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(_mangaDetail.author)
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).detailUpdated + " ",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(DateTime.fromMillisecondsSinceEpoch(
                          _mangaDetail.lastChapterDate.toInt() * 1000)
                      .toString())
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children:
                            categoryChips(context, _mangaDetail.categories)),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(_mangaDetail.description)),
              Padding(padding: const EdgeInsets.only(top: 8.0)),
              Row(children: <Widget>[
                Text(
                  AppLocalizations.of(context).detailStatus + " ",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(_mangaDetail.status)
              ]),
              Padding(padding: const EdgeInsets.only(top: 8.0)),
              Text(
                AppLocalizations.of(context).detailChapters,
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
                      itemCount: _mangaDetail.chapters.length,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ChapterListItemWidget(
                            _mangaDetail.chapters[index]);
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  List<Widget> categoryChips(BuildContext context, List<String> categories) {
    return categories.map((element) {
      return Padding(
        padding: const EdgeInsets.only(right: 2.0),
        child: Chip(
          deleteIcon: null,
          clipBehavior: Clip.antiAlias,
          backgroundColor: Theme.of(context).accentColor,
          label: Text(
            element,
          ),
        ),
      );
    }).toList();
  }
}
