import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/repository/manga_adapter.dart';
import 'package:flutter_app/src/repository/network/manga_network_adapter.dart';
import 'package:flutter_app/src/repository/network/service/mangaeden_service.dart';
import 'package:flutter_app/src/ui/home/home_page_widget.dart';

class SplashScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    fetchManga().then((value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MangaHomePage.gnamGnamHomePage(title: 'Manga'),
          ),
        ));

    return Center(child: CircularProgressIndicator());
  }

  Future fetchManga() async {
    MangaAdapter adapter = MangaNetworkAdapter(MangaedenService());

    var mangaList = await adapter.getMangaList();

//    final response = await http.get(Config.MANGA_LIST);
//
//    if (response.statusCode == 200) {
//      // If the call to the server was successful, parse the JSON
//
//      var jsonFile = json.decode(response.body);
//
////      writeJsonOnFile(jsonFile);
//    } else {
//      // If that call was not successful, throw an error.
//      throw Exception('Failed to load manga');
//    }
  }
//
//  Future<File> writeJsonOnFile(String jsonFile) async {
//    final file = await Config.getAppDirectory();
//
//    // Write the file
//    return file.writeAsString(jsonFile);
//  }
}
