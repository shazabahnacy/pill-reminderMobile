import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.purple,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.purple,
  primaryColor: Colors.purple,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.purpleAccent,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.purple,
);
