import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor;
  Color _secondaryColor;
  double _primaryDotRadius;
  double _secondaryDotRadius;

  set setCurrentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  double get getCurrentPage => this._currentPage;

  set setPrimaryColor(Color primaryColor) => this._primaryColor = primaryColor;
  Color get getPrimaryColor => this._primaryColor;

  set setSecondaryColor(Color secondaryColor) =>
      this._secondaryColor = secondaryColor;
  Color get getSecondaryColor => this._secondaryColor;

  set setPrimaryDotRadius(double primaryDotRadius) =>
      this._primaryDotRadius = primaryDotRadius;
  double get getPrimaryDotRadius => this._primaryDotRadius;

  set setSecondaryDotRadius(double secondaryDotRadius) =>
      this._secondaryDotRadius = secondaryDotRadius;
  double get getSecondaryDotRadius => this._secondaryDotRadius;
}
