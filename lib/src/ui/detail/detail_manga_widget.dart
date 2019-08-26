import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/custom/detail_header_custom_clipper.dart';
import 'package:flutter_app/src/ui/custom/material_ripple.dart';
import 'package:flutter_app/src/ui/detail/detail_body_widget.dart';
import 'package:flutter_app/src/ui/detail/manga_detail_arguments.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailMangaWidget extends StatelessWidget {
  static const routeName = '/manga_detail';

  @override
  Widget build(BuildContext context) {
    final MangaDetailArguments args = ModalRoute.of(context).settings.arguments;

    return Observer(builder: (_) {
      return Scaffold(
          extendBody: true,
          bottomSheet: BottomSheet(
            backgroundColor: Colors.deepPurpleAccent,
            elevation: 6.0,
            enableDrag: true,
            builder: (BuildContext context) {
              var manga = appState.manga;
              if (manga != null && manga.chapters != null) {
                return Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Chapters",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: manga.chapters.length,
                              itemBuilder: (context, index) {
                                return Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 4,
                                    child: Stack(
                                      children: <Widget>[
                                        Center(
                                            child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: AlignmentDirectional
                                                  .topCenter,
                                              end: AlignmentDirectional
                                                  .bottomCenter,
                                              colors: <Color>[
                                                Colors.indigo,
                                                Colors.indigoAccent
                                              ],
                                            ),
                                          ),
                                          child: Center(
                                              child: Text(
                                                  manga.chapters[index].title)),
                                        )),
                                        Positioned.fill(
                                            child: MaterialRipple(
                                          onPressed: () {},
                                        ))
                                      ],
                                    ));
                              }),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Chapters",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "No chapter available",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            onClosing: () {},
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: FloatingActionButton(
              tooltip: "Set this manga as favorite",
              onPressed: () {},
              elevation: 8.0,
              child: Icon(Icons.favorite_border)),
          body: NestedScrollView(
            body: getDetailBody(args.title, appState.manga),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 6.0,
                  forceElevated: true,
                  expandedHeight: 144,
                  floating: true,
                  pinned: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.pop(context, null);
                    },
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: ClipPath(
                        clipper: DetailHeaderCustomClipper(),
                        child: Container(
                          height: 120,
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
              ];
            },
          ));
    });
  }

  Widget getDetailBody(String title, Manga manga) {
    if (manga != null) {
      return DetailBodyWidget(manga, title);
    } else {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
