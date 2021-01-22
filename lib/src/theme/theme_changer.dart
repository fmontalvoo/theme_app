import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _theme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        this._darkTheme = false;
        this._customTheme = false;
        this._theme = ThemeData.light();
        break;
      case 2:
        this._darkTheme = true;
        this._customTheme = false;
        this._theme = ThemeData.dark();
        break;
      case 3:
        this._darkTheme = false;
        this._customTheme = true;
        this._theme = ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        );
        break;
      default:
    }
  }

  set setDarkTheme(bool value) {
    this._darkTheme = value;
    this._customTheme = false;
    if (value)
      this._theme = ThemeData.dark();
    else
      this._theme = ThemeData.light();
    notifyListeners();
  }

  bool get getDarkTheme => this._darkTheme;

  set setCustomTheme(bool value) {
    this._customTheme = value;
    this._darkTheme = false;
    if (value)
      this._theme = ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
    else
      this._theme = ThemeData.light();
    notifyListeners();
  }

  bool get getCustomTheme => this._customTheme;

  ThemeData get getTheme => this._theme;
}
