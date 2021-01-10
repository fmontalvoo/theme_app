import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("¡Hola Mundo!"),
          leading: FaIcon(FontAwesomeIcons.slideshare, color: Colors.blue),
          trailing: Icon(Icons.chevron_right, color: Colors.blue),
          onTap: () {},
        );
      },
    );
  }
}
