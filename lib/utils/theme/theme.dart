import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppThemes{

  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    primaryColor: HexColor("9E54CA"),
    );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
    primaryColor: HexColor("9E54CA"),

  ); 
}
