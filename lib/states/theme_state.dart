import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeState with ChangeNotifier {
  bool _isDarkModeEnabled = false;
  ThemeData get currentTheme => _isDarkModeEnabled
      ? ThemeData.dark().copyWith(
          toggleableActiveColor: Colors.deepPurple[400],
          accentColor: Colors.blueGrey[900],
          buttonTheme: ButtonThemeData(
            height: 40,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepPurple[300]),
        )
      : ThemeData.light().copyWith(
          accentColor: Colors.white,
          buttonTheme: ButtonThemeData(
            height: 40,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepPurple[300]),
        );

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void setDarkMode(bool b) {
    _isDarkModeEnabled = b;
    notifyListeners();
  }
}
