import 'package:flutter/material.dart';

class Tema {
  criaTema() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Georgia',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 35.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 15.0, fontFamily: 'Hind'),
      ),
    );
  }
}
