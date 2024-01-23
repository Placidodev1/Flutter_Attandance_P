// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class TColors {
  TColors._();

  // cores basicas da app
  static const primary = Color(0xfff003459);
  static const secundary = Color(0xFFFFE24B);
  static const accent = Color(0xFFb0c7ff);

  // Gradiant Colors
  static const  Gradient linearGradient = LinearGradient(
  begin : Alignment(0.0, 0.0),
  end: Alignment(0.707, -0.707),
  colors:[
  Color(0xffff9a9e),
  Color(0xfffad0c4),
  Color(0xfffad0c4),]);
  // Cores dos  textos
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6c7570);
  static const Color textWhite = Colors.white;

  //  Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // background de containers
  static const linearContainer = Color(0xfff003459);
  static Color darkContainer = const Color.fromARGB(10, 255, 255, 255);

  // Button Colors
  static const Color buttonPrimary = Color(0xfff003459);
  static const Color buttonSecondary = Color(0xFF6cC7570);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFD3F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF197602);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

}
