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
        this._theme = _temaClaro();
        break;
      case 2:
        this._darkTheme = true;
        this._customTheme = false;
        this._theme = _temaOscuro();
        break;
      case 3:
        this._darkTheme = false;
        this._customTheme = true;
        this._theme = _temaPersonalizado();
        break;
      default:
    }
  }

  set setDarkTheme(bool value) {
    this._darkTheme = value;
    this._customTheme = false;
    if (value)
      this._theme = _temaOscuro();
    else
      this._theme = _temaClaro();
    notifyListeners();
  }

  bool get getDarkTheme => this._darkTheme;

  set setCustomTheme(bool value) {
    this._customTheme = value;
    this._darkTheme = false;
    if (value)
      this._theme = _temaPersonalizado();
    else
      this._theme = _temaClaro();
    notifyListeners();
  }

  bool get getCustomTheme => this._customTheme;

  ThemeData get getTheme => this._theme;

  ThemeData _temaOscuro() {
    return ThemeData.dark().copyWith(accentColor: Colors.deepPurpleAccent);
  }

  ThemeData _temaClaro() {
    return ThemeData.light();
  }

  ThemeData _temaPersonalizado() {
    return ThemeData.dark().copyWith(
      // primarySwatch: Colors.amber,
      accentColor: Color(0xff48a0eb),
      primaryColorLight: Colors.white,
      scaffoldBackgroundColor: Color(0xff16202b),
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
