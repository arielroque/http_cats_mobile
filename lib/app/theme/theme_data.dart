import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primaryColor: Color(0xFFD0383E),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(color: Colors.red),
  fontFamily: "Nunito",
  textTheme: TextTheme(
    headline:
    TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
    button: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.amberAccent,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
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