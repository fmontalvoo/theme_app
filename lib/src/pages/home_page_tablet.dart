import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:themes_app/src/models/router_model.dart';

import 'package:themes_app/src/widgets/user_drawer.dart';

import 'package:themes_app/src/routes/routes.dart';

class HomePageTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final page = Provider.of<RouterModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
      ),
      drawer: UserDrawer(),
      body: Row(
        children: [
          Container(
            width: 300,
            height: double.infinity,
            child: _OptionsList(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: theme.accentColor,
          ),
          Expanded(child: page.getCurrentPage)
        ],
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  final appRoutes = AppRoutes.appRoutes;
  @override
  Widget build(BuildContext context) {
    final page = Provider.of<RouterModel>(context);
    final appTheme = Theme.of(context);
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: appRoutes.length,
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(appRoutes[index].title),
          leading: FaIcon(appRoutes[index].icon, color: appTheme.accentColor),
          trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
          onTap: () {
            page.setCurrentPage = appRoutes[index].page;
          },
        );
      },
    );
  }
}
