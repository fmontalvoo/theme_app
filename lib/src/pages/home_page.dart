import 'package:flutter/material.dart';

import 'package:themes_app/src/widgets/user_drawer.dart';

import 'package:themes_app/src/widgets/options_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
      ),
      drawer: UserDrawer(),
      body: OptionsList(),
    );
  }
}
