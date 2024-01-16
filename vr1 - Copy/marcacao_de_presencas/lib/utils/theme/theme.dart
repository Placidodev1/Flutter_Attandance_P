// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/utils/theme/custum_themes/appbar_theme.dart';
import 'package:marcacao_de_presenca/utils/theme/custum_themes/botton_sheet_theme.dart';
import 'package:marcacao_de_presenca/utils/theme/custum_themes/checkbox_theme.dart';
import 'package:marcacao_de_presenca/utils/theme/custum_themes/chip_theme.dart';
import 'package:marcacao_de_presenca/utils/theme/custum_themes/elevated_button_theme.dart';
import 'package:marcacao_de_presenca/utils/theme/custum_themes/outlined_button_theme.dart';
import 'package:marcacao_de_presenca/utils/theme/custum_themes/text_field_theme.dart';
import 'package:marcacao_de_presenca/utils/theme/custum_themes/text_theme.dart';


class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: const Color(0xfff003459),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTheme, 
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtomTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme
    
    
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: const Color(0xfff003459),
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme
  );
}
