import 'package:flutter/material.dart';

class MenuStateModel with ChangeNotifier {
  int _currentIndex = 0;
  bool _showMenu = true;

  set setCurrentIndex(int index) {
    this._currentIndex = index;
    notifyListeners();
  }

  int get getCurrentIndex => this._currentIndex;

  set setShowMenu(bool show) {
    this._showMenu = show;
    notifyListeners();
  }

  bool get getShowMenu => this._showMenu;
}