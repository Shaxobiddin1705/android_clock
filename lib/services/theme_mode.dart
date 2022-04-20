
import 'package:flutter/material.dart';

class Themes {
  BuildContext? context;
  Themes({required this.context});

  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    brightness: Brightness.dark,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.blueAccent,
      backgroundColor: Colors.white,
    ),
    dividerColor: Colors.black,
    canvasColor: Colors.black,
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white
    )
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.indigo,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.indigo,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.indigo,
    ),
    canvasColor: Colors.white,
      popupMenuTheme: const PopupMenuThemeData(
          color: Colors.indigo
      ),
  );
}