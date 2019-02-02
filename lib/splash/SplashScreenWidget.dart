import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/helper/Configuration.dart' as Config;
import 'package:flutter_app/home/HomePageWidget.dart';
import 'package:http/http.dart' as http;

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

    return CircularProgressIndicator();
  }

  Future fetchManga() async {
    final response = await http.get(Config.MANGA_LIST);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON

      var jsonFile = json.decode(response.body);

      writeJsonOnFile(jsonFile);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load manga');
    }
  }

  Future<File> writeJsonOnFile(String jsonFile) async {
    final file = await Config.getAppDirectory();

    // Write the file
    return file.writeAsString(jsonFile);
  }
}
