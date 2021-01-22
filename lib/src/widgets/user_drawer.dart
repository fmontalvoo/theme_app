import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:themes_app/src/theme/theme_changer.dart';

import 'package:themes_app/src/widgets/options_list.dart';

class UserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final theme = Theme.of(context);
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20.0),
                width: double.infinity,
                height: 200.0,
                child: CircleAvatar(
                  backgroundColor: theme.accentColor,
                  child: Text('FM', style: TextStyle(fontSize: 50.0)),
                ),
              ),
            ),
            Expanded(
              child: OptionsList(),
            ),
            ListTile(
              title: Text('Dark Mode'),
              leading: Icon(Icons.lightbulb_outline, color: theme.accentColor),
              trailing: Switch.adaptive(
                  value: appTheme.getDarkTheme,
                  activeColor: theme.accentColor,
                  onChanged: (value) => appTheme.setDarkTheme = value),
            ),
            SafeArea(
              bottom: true,
              top: false,
              child: ListTile(
                title: Text('Custom Theme'),
                leading:
                    Icon(Icons.add_to_home_screen, color: theme.accentColor),
                trailing: Switch.adaptive(
                    value: appTheme.getCustomTheme,
                    activeColor: theme.accentColor,
                    onChanged: (value) => appTheme.setCustomTheme = value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
