import 'package:flutter/material.dart';

import 'package:themes_app/src/widgets/list_item.dart';
import 'package:themes_app/src/widgets/button_list.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildCustomScrollView(context),
          Positioned(bottom: -10.0, right: 0.0, child: ButtonList())
        ],
      ),
    );
  }

  CustomScrollView buildCustomScrollView(BuildContext context) {
    final items = [
      ListItem(title: 'Orange', color: Color(0xffF08F66)),
      ListItem(title: 'Family', color: Color(0xffF2A38A)),
      ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
      ListItem(title: 'Books', color: Color(0xffFCEBAF)),
      ListItem(title: 'Orange', color: Color(0xffF08F66)),
      ListItem(title: 'Family', color: Color(0xffF2A38A)),
      ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
      ListItem(title: 'Books', color: Color(0xffFCEBAF)),
      ListItem(title: 'Orange', color: Color(0xffF08F66)),
      ListItem(title: 'Family', color: Color(0xffF2A38A)),
      ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
      ListItem(title: 'Books', color: Color(0xffFCEBAF)),
      ListItem(title: 'Orange', color: Color(0xffF08F66)),
      ListItem(title: 'Family', color: Color(0xffF2A38A)),
      ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
      ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    ];
    final theme = Theme.of(context);
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverAppBar(
              minHeight: 170.0,
              maxHeight: 200.0,
              child: Container(
                  alignment: Alignment.centerLeft,
                  color: theme.scaffoldBackgroundColor,
                  child: titulo(theme))),
        ),
        SliverList(
            delegate:
                SliverChildListDelegate([...items, SizedBox(height: 100.0)])),
      ],
    );
  }

  Widget titulo(ThemeData theme) {
    return Column(
      children: [
        SizedBox(height: 20.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Text(
            "New",
            style: TextStyle(
                color: theme.textTheme.bodyText2.color, fontSize: 50.0),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            "List",
            style: TextStyle(
              color: Color(0xffd93a30),
              fontSize: 50.0,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xfff7cdd5),
              decorationThickness: 3.0,
              fontWeight: FontWeight.bold,
              // decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class _SliverAppBar extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBar({this.minHeight, this.maxHeight, this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: this.child);
  }

  @override
  double get maxExtent =>
      (this.minHeight > this.maxHeight) ? this.minHeight : this.maxHeight;

  @override
  double get minExtent =>
      (this.maxHeight < this.minHeight) ? this.maxHeight : this.minHeight;

  @override
  bool shouldRebuild(covariant _SliverAppBar oldDelegate) {
    return this.maxHeight != oldDelegate.maxHeight ||
        this.minHeight != oldDelegate.minHeight ||
        this.child != oldDelegate.child;
  }
}
