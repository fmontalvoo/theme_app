import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:themes_app/src/models/menu_state_model.dart';

import 'package:themes_app/src/widgets/pinterest_grid.dart';
import 'package:themes_app/src/widgets/pinterest_menu.dart';
import 'package:themes_app/src/widgets/pinterest_menu_item.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => MenuStateModel(),
        child: Builder(
          builder: (BuildContext context) {
            // print(Provider.of<MenuStateModel>(context).getShowMenu);
            return _body(Provider.of<MenuStateModel>(context).getShowMenu);
          },
        ),
      ),
    );
  }

  Widget _body(bool show) {
    return Stack(
      children: [
        PinterestGrid(),
        PinterestMenu(
          backgroundColor: Colors.white70,
          showMenu: show,
          items: [
            PinterestMenuItem(
                icon: Icon(Icons.camera),
                selectedColor: Colors.deepPurple,
                unSelectedColor: Colors.blueGrey,
                onPressed: () {}),
            PinterestMenuItem(
                icon: Icon(Icons.search),
                selectedColor: Colors.deepPurple,
                unSelectedColor: Colors.blueGrey,
                onPressed: () {}),
            PinterestMenuItem(
                icon: Icon(Icons.notifications),
                selectedColor: Colors.deepPurple,
                unSelectedColor: Colors.blueGrey,
                onPressed: () {}),
            PinterestMenuItem(
                icon: Icon(Icons.account_circle),
                selectedColor: Colors.deepPurple,
                unSelectedColor: Colors.blueGrey,
                onPressed: () {}),
          ],
        )
      ],
    );
  }
}
