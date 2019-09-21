import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/src/config/configuration.dart';
import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/domain/manga_status.dart';
import 'package:flutter_app/src/locale/app_localizations.dart';
import 'package:flutter_app/src/resource/resource_string.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/detail/detail_body_widget.dart';
import 'package:flutter_app/src/ui/detail/detail_manga_arguments.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailMangaWidget extends StatefulWidget {
  static const routeName = '/manga_detail';

  @override
  _DetailMangaWidgetState createState() => _DetailMangaWidgetState();
}

class _DetailMangaWidgetState extends State<DetailMangaWidget> {
  final sliverAppBarHeight = 256.0;

  double translateFab = 0.0;

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  _onScroll() {
    translateFab = _controller.offset;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final DetailMangaArguments args = ModalRoute.of(context).settings.arguments;

    return Observer(builder: (_) {
      return getBodyWithCustomScrollView(context, args);
    });
  }

  Widget getBodyWithCustomScrollView(
      BuildContext context, DetailMangaArguments args) {
    var fabIcon = appState.checkMangaFavorite
        ? Icon(Icons.favorite)
        : Icon(Icons.favorite_border);

    if (appState.mangaDetail != null) {
      args.manga = Manga.copyWithMangaDetail(args.manga, appState.mangaDetail);

      args.manga = Manga.copyWithMangaDetail(
        args.manga,
        MangaDetail.copyWithChapters(
          args.manga.mangaDetail,
          appState.mangaDetail.chapters.map((element) {
            return Chapter.copyWithMangaID(element, args.manga.mangaID);
          }).toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            height: 56.0,
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "${AppLocalizations.of(context).detailStatus}: ",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          args.manga.mangaDetail != null
                              ? getLocalizedStatus(
                                  context, args.manga.mangaDetail.status)
                              : "...",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "${AppLocalizations.of(context).detailUpdated}: ",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          args.manga.mangaDetail != null
                              ? DateFormat.yMd().format(
                                  DateTime.fromMillisecondsSinceEpoch(args
                                          .manga.mangaDetail.lastChapterDate
                                          .toInt() *
                                      1000),
                                )
                              : "...",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FittedBox(
        child: FloatingActionButton(
            tooltip: MANGA_DETAIL_FAB_TOOLTIP,
            onPressed: () {
              appState.addRemoveMangaFavorite(args.manga);
            },
            child: fabIcon),
      ),
      body: NestedScrollView(
        controller: _controller,
        physics: ClampingScrollPhysics(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[getDetailBody(args.manga)],
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              forceElevated: true,
              expandedHeight: sliverAppBarHeight,
              floating: true,
              pinned: true,
              snap: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pop(context, null);
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.none,
                background: Container(
                  height: sliverAppBarHeight,
                  child: Flex(
                    children: <Widget>[
                      Expanded(
                        child: Hero(
                          child: FadeInImage.assetNetwork(
                              placeholder: kTransparentImage.toString(),
                              fit: BoxFit.cover,
                              image: args.manga.image != null
                                  ? args.manga.image
                                  : gridImagePlaceholder),
                          tag: args.manga.mangaID,
                        ),
                      )
                    ],
                    direction: Axis.horizontal,
                  ),
                ),
              ),
            ),
          ];
        },
      ),
    );
  }

  Widget getDetailBody(Manga manga) {
    if (manga != null && appState.mangaDetail != null) {
      return DetailBodyWidget(manga.title, appState.mangaDetail);
    } else {
      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
  }
}
