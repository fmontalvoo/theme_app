import 'package:flutter/material.dart';

class RouterModel with ChangeNotifier {
  Widget _currentPage;

  RouterModel({Widget currentPage}) : this._currentPage = currentPage;

  set setCurrentPage(Widget page) {
    this._currentPage = page;
    notifyListeners();
  }

  Widget get getCurrentPage => this._currentPage;
}
