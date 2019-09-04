import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomwDrawer extends StatefulWidget {
  @override
  _HomwDrawerState createState() => _HomwDrawerState();
}

class _HomwDrawerState extends State<HomwDrawer> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Container(),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("Accedi con Google"),
            )
          ],
        ));
      },
    );
  }
}
