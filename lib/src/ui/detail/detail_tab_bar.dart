import 'package:flutter/material.dart';

class DetailTabBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: TabBar(
          tabs: <Widget>[
            Tab(
              text: "Details",
            ),
            Tab(
              text: "Chapters",
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
