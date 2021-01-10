import 'package:flutter/material.dart';

import 'package:themes_app/src/widgets/options_list.dart';

class UserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  child: Text('FM', style: TextStyle(fontSize: 50.0)),
                ),
              ),
            ),
            Expanded(
              child: OptionsList(),
            ),
            ListTile(
              title: Text('Dark Mode'),
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
              trailing: Switch.adaptive(
                  value: true, activeColor: Colors.blue, onChanged: (value) {}),
            ),
            ListTile(
              title: Text('Custom Theme'),
              leading: Icon(Icons.add_to_home_screen, color: Colors.blue),
              trailing: Switch.adaptive(
                  value: true, activeColor: Colors.blue, onChanged: (value) {}),
            ),
          ],
        ),
      ),
    );
  }
}
