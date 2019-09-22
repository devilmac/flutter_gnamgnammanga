import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
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
          ),
        );
      },
    );
  }
}
