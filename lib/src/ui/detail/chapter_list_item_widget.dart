import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/repository/manga_adapter.dart';
import 'package:flutter_app/src/repository/network/manga_network_adapter.dart';
import 'package:flutter_app/src/repository/network/service/mangaeden/mangaeden_service.dart';

class ChapterListItemWidget extends StatefulWidget {
  final Chapter _chapter;

  ChapterListItemWidget(this._chapter);

  @override
  _ChapterListItemWidgetState createState() => _ChapterListItemWidgetState();
}

class _ChapterListItemWidgetState extends State<ChapterListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return null;
  }

  Future<void> fetchChapterDetail(String chapterID) async {
    MangaAdapter adapter = MangaNetworkAdapter(MangaedenService());

    var mangaDetail = await adapter.getMangaDetail(chapterID);

//    appState.manga = mangaDetail;
  }
}
