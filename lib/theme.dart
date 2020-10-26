import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Color primaryColor = Colors.blue;
Color borderColor = Colors.black.withOpacity(0.12);
Color iconColor = Colors.black.withOpacity(0.54);

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  accentColor: primaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  iconTheme: IconThemeData(
    color: iconColor,
  ),
  textTheme: TextTheme(
    overline: TextStyle(
      fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.6)),
    headline6: TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.87)),
  ),
);
