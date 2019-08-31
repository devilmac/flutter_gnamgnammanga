import 'package:flutter/material.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/reading/reading_chapter_arguments.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_view/photo_view.dart';

class ReadingChapterWidget extends StatelessWidget {
  static const routeName = '/read_chapter';

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final ReadingChapterArguments args =
        ModalRoute.of(context).settings.arguments;

    return Observer(
      builder: (_) {
        if (appState.currentReadingChapter != null) {
          return Container(
            color: Colors.black87,
            height: double.infinity,
            width: double.infinity,
            child: PageView.builder(
                controller: pageController,
                itemCount: appState.currentReadingChapter.length,
                itemBuilder: (context, index) {
                  var page = appState.currentReadingChapter[index];

                  return PhotoView(imageProvider: NetworkImage(page.imageUrl)
//                    child: FadeInImage.assetNetwork(
//                        fit: BoxFit.fitWidth,
//                        placeholder: IMAGE_PLACEHOLDER,
//                        image: page.imageUrl != null
//                            ? page.imageUrl
//                            : gridImagePlaceholder),
                      );
                }),
          );
        } else {
          return Container(
            color: Colors.black87,
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
