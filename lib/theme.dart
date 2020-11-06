import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Color primaryColor = Colors.blue;
Color borderColor = Colors.black.withOpacity(0.12);
Color iconColor = Colors.black.withOpacity(0.54);

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: primaryColor,
  accentColor: primaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  iconTheme: IconThemeData(
    color: iconColor,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black54,
      // fontWeight: FontWeight.w300
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.bold
    )
  )
);
