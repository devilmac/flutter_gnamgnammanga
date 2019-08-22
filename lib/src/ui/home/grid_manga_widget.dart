import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/manga.dart';

class GridMangaWidget extends StatelessWidget {
//  GridMangaWidget({this.mangas});

//  final List<int> mangas;

  @override
  Widget build(BuildContext context) {
    //TODO Create grid layout to show manga
    return Center(
      child: FutureBuilder<Manga>(
//        future: fetchManga(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.title);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
//    return GridView.count(
//      primary: false,
//      padding: const EdgeInsets.all(20.0),
//      crossAxisSpacing: 10.0,
//      crossAxisCount: 2,
//      children: <Widget>[
//        const Text('He\'d have you all unravel at the'),
//        const Text('Heed not the rabble'),
//        const Text('Sound of screams but the'),
//        const Text('Who scream'),
//        const Text('Revolution is coming...'),
//        const Text('Revolution, they...'),
//      ],
//    );
  }
}
