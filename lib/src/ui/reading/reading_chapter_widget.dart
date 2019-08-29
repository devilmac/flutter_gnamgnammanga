import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ReadingChapterWidget extends StatelessWidget {
  static const routeName = '/read_chapter';

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          color: Colors.black87,
          height: double.infinity,
          width: double.infinity,
        );
      },
    );
  }
}
