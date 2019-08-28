import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/custom/circle_appbar_leading_clipper.dart';
import 'package:flutter_app/src/ui/detail/detail_body_widget.dart';
import 'package:flutter_app/src/ui/detail/manga_detail_arguments.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailMangaWidget extends StatelessWidget {
  static const routeName = '/manga_detail';

  final sliverAppBarHeight = 232.0;

  @override
  Widget build(BuildContext context) {
    final MangaDetailArguments args = ModalRoute.of(context).settings.arguments;

    return Observer(builder: (_) {
      return getBodyWithCustomScrollView(context, args);
    });
  }

  Widget getBodyWithCustomScrollView(
      BuildContext context, MangaDetailArguments args) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
          tooltip: "Set this manga as favorite",
          onPressed: () {},
          elevation: 8.0,
          child: Icon(Icons.favorite_border)),
      body: CustomScrollView(
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
                              image: args.imageUrl),
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
                children: <Widget>[getDetailBody(args.title, appState.manga)],
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget getDetailBody(String title, Manga manga) {
    if (manga != null) {
      return DetailBodyWidget(manga, title);
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
