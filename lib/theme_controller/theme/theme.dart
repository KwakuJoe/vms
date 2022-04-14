import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

const Color darkgrey = Color(0xFF424242);
Color lightgrey = HexColor("#F3F3F3");
Color textFieldLightClr = HexColor("#F3F3F3");
Color textFieldDarktClr = HexColor("#3F484E");
Color primaryClr = HexColor("#307DF6");

const Color white = Colors.white;
const Color darkBackGroundColor = Color(0xFF121212);

Color lightBackgroundColor = HexColor("#F3F3F3");

// colour theme
class Themes {
  static final lightTheme = ThemeData(
    backgroundColor: lightBackgroundColor,
    primaryColor: primaryClr,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: HexColor("#F9F9F9"),
    ),
  );

  static final darkTheme = ThemeData(
      backgroundColor: darkBackGroundColor,
      primaryColor: primaryClr,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(backgroundColor: HexColor("#2A343A")));
}
