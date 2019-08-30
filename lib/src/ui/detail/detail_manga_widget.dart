import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/src/config/configuration.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/resource/resource_string.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/custom/circle_appbar_leading_clipper.dart';
import 'package:flutter_app/src/ui/detail/detail_body_widget.dart';
import 'package:flutter_app/src/ui/detail/manga_detail_arguments.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailMangaWidget extends StatefulWidget {
  static const routeName = '/manga_detail';

  @override
  _DetailMangaWidgetState createState() => _DetailMangaWidgetState();
}

class _DetailMangaWidgetState extends State<DetailMangaWidget> {
  final sliverAppBarHeight = 232.0;

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
    final MangaDetailArguments args = ModalRoute.of(context).settings.arguments;

    return Observer(builder: (_) {
      return getBodyWithCustomScrollView(context, args);
    });
  }

  Widget getBodyWithCustomScrollView(
      BuildContext context, MangaDetailArguments args) {
    var fabIcon =
        appState.checkMangaFavorite ? Icons.favorite : Icons.favorite_border;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: AnimatedBuilder(
        child: FittedBox(
          child: FloatingActionButton(
              tooltip: MANGA_DETAIL_FAB_TOOLTIP,
              onPressed: () {
                appState.addRemoveMangaFavorite(appState.manga);
              },
              child: Icon(fabIcon)),
        ),
        builder: (BuildContext context, Widget child) {
          return Transform.translate(
            offset: Offset(0.0, translateFab),
            child: child,
          );
        },
        animation: _controller,
      ),
      body: CustomScrollView(
        controller: _controller,
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
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
              collapseMode: CollapseMode.parallax,
              background: ClipPath(
                  clipper: CircleAppBarLeadingClipper(),
                  child: Container(
                    height: sliverAppBarHeight,
                    child: Flex(
                      children: <Widget>[
                        Expanded(
                            child: Hero(
                          child: FadeInImage.assetNetwork(
                              placeholder: kTransparentImage.toString(),
                              fit: BoxFit.cover,
                              image: args.imageUrl != null
                                  ? args.imageUrl
                                  : gridImagePlaceholder),
                          tag: args.mangaID,
                        ))
                      ],
                      direction: Axis.horizontal,
                    ),
                  )),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: <Widget>[getDetailBody(args, appState.manga)],
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget getDetailBody(MangaDetailArguments args, Manga manga) {
    if (manga != null) {
      manga.mangaID = args.mangaID;
      manga.image = args.imageUrl;

      return DetailBodyWidget(manga, args.title);
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
