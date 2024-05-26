import 'package:flutter/material.dart';

ThemeData LightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Color.fromARGB(255, 0, 0, 0),
      secondary: Color.fromARGB(255, 204, 170, 221),
      tertiary: Color.fromARGB(255, 197, 197, 197),
    ));

ThemeData DarkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        primary: Colors.white,
        secondary: Color.fromARGB(255, 204, 170, 221),
        tertiary: Color.fromARGB(255, 50, 50, 50)));
