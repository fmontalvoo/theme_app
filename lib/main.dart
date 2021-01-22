import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:themes_app/src/pages/home_page.dart';
import 'package:themes_app/src/theme/theme_changer.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => ThemeChanger(1), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).getTheme;
    return MaterialApp(
      title: 'Themes App',
      theme: theme,
      home: HomePage(),
    );
  }
}
