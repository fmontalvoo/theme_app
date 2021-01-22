import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:themes_app/src/routes/routes.dart';

class OptionsList extends StatelessWidget {
  final appRoutes = AppRoutes.appRoutes;
  @override
  Widget build(BuildContext context) {
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => appRoutes[index].page));
          },
        );
      },
    );
  }
}
