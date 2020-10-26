import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Color primaryColor = Colors.blue;
Color accentColor = Colors.blue.withOpacity(54);
Color borderColor = Colors.black.withOpacity(12);

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  accentColor: accentColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    overline: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.w700),
    headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
  ),
);
