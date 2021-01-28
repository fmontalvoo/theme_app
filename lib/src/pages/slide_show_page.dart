import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:themes_app/src/widgets/slide_show.dart';

// ignore: must_be_immutable
class SlideShowPage extends StatelessWidget {
  bool isLarge;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.height > 600)
      isLarge = true;
    else
      isLarge = false;

    final theme = Theme.of(context);
    final slideShow = SlideShow(
      primaryColor: theme.accentColor,
      // secondaryColor: Colors.white,
      children: [
        SvgPicture.asset('lib/assets/images/slide-1.svg'),
        SvgPicture.asset('lib/assets/images/slide-2.svg'),
        SvgPicture.asset('lib/assets/images/slide-3.svg'),
        SvgPicture.asset('lib/assets/images/slide-4.svg'),
        SvgPicture.asset('lib/assets/images/slide-5.svg'),
      ],
    );

    final children = [Expanded(child: slideShow), Expanded(child: slideShow)];
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: isLarge ? Column(children: children) : Row(children: children));
  }
}
