import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/repository/manga_adapter.dart';
import 'package:flutter_app/src/repository/network/manga_network_adapter.dart';
import 'package:flutter_app/src/repository/network/service/mangaeden/mangaeden_service.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/detail/detail_body_widget.dart';
import 'package:flutter_app/src/ui/detail/manga_detail_header_custom_clipper.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailMangaWidget extends StatelessWidget {
  DetailMangaWidget(this._manga);

  final Manga _manga;

  @override
  Widget build(BuildContext context) {
    fetchMangaDetail(_manga.mangaID);

    return Observer(builder: (_) {
      return
//        DefaultTabController(
//          child:
          Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.deepPurpleAccent,
                  tooltip: "Set this manga as favorite",
                  onPressed: () {},
                  child: Icon(Icons.favorite_border)),
              body: NestedScrollView(
                body: getDetailBody(_manga.title, appState.manga),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      expandedHeight: 144,
                      floating: true,
                      pinned: false,
                      snap: true,
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.pop(context, null);
                        },
                      ),
//                      bottom: DetailTabBar(),
                      flexibleSpace: FlexibleSpaceBar(
                        background: ClipPath(
                            clipper: MangaDetailHeaderCustomClipper(),
                            child: Container(
                              height: 120,
                              child: Flex(
                                children: <Widget>[
                                  Expanded(
                                      child: Hero(
                                    child: FadeInImage.assetNetwork(
                                        placeholder:
                                            kTransparentImage.toString(),
                                        fit: BoxFit.cover,
                                        image: _manga.image),
                                    tag: _manga.mangaID,
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
//          length: 2);
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

  Future<void> fetchMangaDetail(String mangaID) async {
    MangaAdapter adapter = MangaNetworkAdapter(MangaedenService());

    var mangaDetail = await adapter.getMangaDetail(mangaID);

    appState.manga = mangaDetail;
  }
}
