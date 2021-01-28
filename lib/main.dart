import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:themes_app/src/models/router_model.dart';

import 'package:themes_app/src/pages/home_page.dart';
import 'package:themes_app/src/pages/slide_page.dart';
import 'package:themes_app/src/pages/home_page_tablet.dart';

import 'package:themes_app/src/theme/theme_changer.dart';

void main() {
  runApp(MultiProvider(providers: [
    // Provider(create: (_) => ThemeChanger(1)),
    ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(1)),
    ChangeNotifierProvider<RouterModel>(
        create: (_) => RouterModel(currentPage: SlideShowPage()))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).getTheme;
    return MaterialApp(
      title: 'Themes App',
      theme: theme,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final size = MediaQuery.of(context).size;
          if (size.width > 600)
            return HomePageTablet();
          else
            return HomePage();
        },
      ),
    );
  }
}
