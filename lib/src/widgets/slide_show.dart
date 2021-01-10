import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:themes_app/src/models/slider_model.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> children;
  final Color primaryColor;
  final Color secondaryColor;
  final bool bottomDots;
  final double primaryDotRadius;
  final double secondaryDotRadius;

  const SlideShow({
    Key key,
    this.children = const <Widget>[],
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.bottomDots = true,
    this.primaryDotRadius = 21.0,
    this.secondaryDotRadius = 14.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<SliderModel>(context).setPrimaryColor =
                  this.primaryColor;
              Provider.of<SliderModel>(context).setSecondaryColor =
                  this.secondaryColor;
              Provider.of<SliderModel>(context).setPrimaryDotRadius =
                  this.primaryDotRadius;
              Provider.of<SliderModel>(context).setSecondaryDotRadius =
                  this.secondaryDotRadius;

              return _BuildSlide(bottomDots: bottomDots, children: children);
            },
          ),
        ),
      ),
    );
  }
}

class _BuildSlide extends StatelessWidget {
  const _BuildSlide({
    Key key,
    @required this.bottomDots,
    @required this.children,
  }) : super(key: key);

  final bool bottomDots;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!this.bottomDots) _Dots(this.children.length),
        Expanded(child: _SlideShow(this.children)),
        if (this.bottomDots) _Dots(this.children.length)
      ],
    );
  }
}

class _SlideShow extends StatefulWidget {
  final List<Widget> children;

  _SlideShow(this.children);

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
        physics: BouncingScrollPhysics(),
        controller: pageViewController,
        children: widget.children.map((child) => _Slide(child)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget child;

  _Slide(this.child);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(42.0),
        child: this.child);
  }
}

class _Dots extends StatelessWidget {
  final int length;
  _Dots(this.length);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final sliderModel = Provider.of<SliderModel>(context);
    final pageIndex = sliderModel.getCurrentPage;
    double radius;
    Color color;
    if (pageIndex >= this.index - 0.5 && pageIndex < this.index + 0.5) {
      radius = sliderModel.getPrimaryDotRadius;
      color = sliderModel.getPrimaryColor;
    } else {
      radius = sliderModel.getSecondaryDotRadius;
      color = sliderModel.getSecondaryColor;
    }
    return AnimatedContainer(
      width: radius,
      height: radius,
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 7.0),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
