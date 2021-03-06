import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:flutter_app/src/ui/custom/custom_material_ripple.dart';
import 'package:flutter_app/src/ui/reading/reading_chapter_arguments.dart';
import 'package:flutter_app/src/ui/reading/reading_chapter_widget.dart';

class ChapterListItemWidget extends StatelessWidget {
  final Chapter _chapter;

  ChapterListItemWidget(this._chapter);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Center(
                        child: Hero(
                          tag: _chapter.chapterID,
                          child: Image.asset(
                            "assets/chapter_placeholder.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Chapter " + _chapter.number,
                  ),
                )
              ],
            ),
            Positioned.fill(
              child: MaterialRipple(
                onPressed: () {
                  appState.getChapterDetail(_chapter.chapterID);

                  Navigator.pushNamed(context, ReadingChapterWidget.routeName,
                      arguments: ReadingChapterArguments(_chapter));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
