import 'package:chatapp/common/const/color.dart';
import 'package:chatapp/common/const/font_style.dart';
import 'package:flutter/material.dart';

ThemeData whiteTheme = ThemeData(
    fontFamily: "Inter",
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(backgroundColor: white),
    listTileTheme: ListTileThemeData(
      titleTextStyle: nameText,
    ));

ThemeData darkTheme = ThemeData(fontFamily: "Inter");
