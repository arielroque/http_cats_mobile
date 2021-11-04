import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/theme/color_theme.dart';
import 'package:flutter_clean_architecture/app/theme/font_size.dart';

ThemeData themeData = ThemeData(
  primaryColor: ColorTheme.PRIMARY_COLOR,
  accentColor: ColorTheme.PRIMARY_COLOR,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(color: ColorTheme.PRIMARY_COLOR),
  fontFamily: "Nunito",
  textTheme: TextTheme(
    headline:
    TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
    button: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: FontSize.FONT_SIZE_REGULAR),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.all(8),
    filled: true,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Colors.white)) ,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(style: BorderStyle.none),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),

);