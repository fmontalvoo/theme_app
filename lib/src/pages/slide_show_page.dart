import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:themes_app/src/widgets/slide_show.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SlideShow(
        primaryColor: theme.accentColor,
        // secondaryColor: Colors.white,
        children: [
          SvgPicture.asset('lib/assets/images/slide-1.svg'),
          SvgPicture.asset('lib/assets/images/slide-2.svg'),
          SvgPicture.asset('lib/assets/images/slide-3.svg'),
          SvgPicture.asset('lib/assets/images/slide-4.svg'),
          SvgPicture.asset('lib/assets/images/slide-5.svg'),
        ],
      ),
    );
  }
}
