import 'package:flutter/material.dart';

import 'package:themes_app/src/widgets/pinterest_menu_item.dart';

class PinterestMenu extends StatefulWidget {
  final bool showMenu;
  final Color backgroundColor;
  final List<PinterestMenuItem> items;

  const PinterestMenu(
      {Key key,
      this.showMenu = true,
      this.backgroundColor = Colors.white,
      @required this.items})
      : super(key: key);
  @override
  _PinterestMenuState createState() => _PinterestMenuState();
}

class _PinterestMenuState extends State<PinterestMenu> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 30.0,
      child: Container(
          width: size.width, child: Align(child: _buildContainer(size))),
    );
  }

  Widget _buildContainer(Size size) {
    return AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: (widget.showMenu) ? 1 : 0,
        child: Container(
          width: size.width * .5,
          height: 70.0,
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(100.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black45, blurRadius: 10.0, spreadRadius: -2.5)
              ]),
          child: _items(),
        ));
  }

  Widget _items() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
          widget.items.length,
          (index) => Expanded(
                child: PinterestMenuItem.build(
                  index: index,
                  icon: widget.items[index].icon,
                  selectedColor: widget.items[index].selectedColor,
                  unSelectedColor: widget.items[index].unSelectedColor,
                  title: widget.items[index].title,
                  onPressed: widget.items[index].onPressed,
                ),
              )),
    );
  }
}
