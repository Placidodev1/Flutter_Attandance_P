// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Color(0xfff003459),
    surfaceTintColor: Color(0xfff003459),
    iconTheme: IconThemeData(color: Color(0xfff003459), size: 24),
    actionsIconTheme: IconThemeData(color: Color(0xfff003459), size: 24),
    titleTextStyle: TextStyle(
    fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Color(0xfff003459),
    surfaceTintColor: Color(0xfff003459),
    iconTheme: IconThemeData(color: Color(0xfff003459), size: 24),
    actionsIconTheme: IconThemeData(color: Color(0xfff003459), size: 24),
    titleTextStyle: TextStyle(
    fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
  );
}
