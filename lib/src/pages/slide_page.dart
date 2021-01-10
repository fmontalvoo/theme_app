import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:themes_app/src/models/slider_model.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => SliderModel(),
        child: Center(
          child: Column(
            children: [Expanded(child: _SlideShow()), _Dots()],
          ),
        ),
      ),
    );
  }
}

class _SlideShow extends StatefulWidget {
  @override
  __SlideShowState createState() => __SlideShowState();
}

class __SlideShowState extends State<_SlideShow> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).setCurrentPage =
          pageViewController.page;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: [
          _SlideImage(imageUrl: 'lib/assets/images/slide-1.svg'),
          _SlideImage(imageUrl: 'lib/assets/images/slide-2.svg'),
          _SlideImage(imageUrl: 'lib/assets/images/slide-3.svg'),
        ],
      ),
    );
  }
}

class _SlideImage extends StatelessWidget {
  final String imageUrl;

  _SlideImage({Key key, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(42.0),
        child: SvgPicture.asset(imageUrl));
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageIndex = Provider.of<SliderModel>(context).getCurrentPage;
    return AnimatedContainer(
      width: 14.0,
      height: 14.0,
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 7.0),
      decoration: BoxDecoration(
          color: (pageIndex >= this.index - 0.5 && pageIndex < this.index + 0.5)
              ? Colors.blue
              : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}
