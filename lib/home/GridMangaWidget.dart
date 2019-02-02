import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/Manga.dart';
import 'package:http/http.dart' as http;

Future<Manga> fetchManga() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Manga.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load manga');
  }
}

class GridMangaWidget extends StatelessWidget {
//  GridMangaWidget({this.mangas});

//  final List<int> mangas;

  @override
  Widget build(BuildContext context) {
    //TODO Create grid layout to show manga
    return Center(
      child: FutureBuilder<Manga>(
        future: fetchManga(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.title);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return CircularProgressIndicator();
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
