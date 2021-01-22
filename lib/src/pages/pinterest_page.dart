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
            return _body(
                context, Provider.of<MenuStateModel>(context).getShowMenu);
          },
        ),
      ),
    );
  }

  Widget _body(BuildContext context, bool show) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        PinterestGrid(),
        PinterestMenu(
          backgroundColor: theme.scaffoldBackgroundColor,
          showMenu: show,
          items: [
            PinterestMenuItem(
                icon: Icon(Icons.camera),
                selectedColor: theme.accentColor,
                // unSelectedColor: Colors.blueGrey,
                onPressed: () {}),
            PinterestMenuItem(
                icon: Icon(Icons.search),
                selectedColor: theme.accentColor,
                // unSelectedColor: Colors.blueGrey,
                onPressed: () {}),
            PinterestMenuItem(
                icon: Icon(Icons.notifications),
                selectedColor: theme.accentColor,
                // unSelectedColor: Colors.blueGrey,
                onPressed: () {}),
            PinterestMenuItem(
                icon: Icon(Icons.account_circle),
                selectedColor: theme.accentColor,
                // unSelectedColor: Colors.blueGrey,
                onPressed: () {}),
          ],
        )
      ],
    );
  }
}
