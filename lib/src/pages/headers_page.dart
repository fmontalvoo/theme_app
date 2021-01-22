import 'package:flutter/material.dart';

import 'package:themes_app/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: HeaderWave(color: theme.accentColor),
    );
  }
}
