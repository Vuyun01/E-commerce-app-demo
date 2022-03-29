import 'package:flutter/material.dart';

import '../constants.dart';

ThemeData ThemeApp() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white.withOpacity(0.98),
      fontFamily: 'Muli',
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: TextStyle(color: kTextColor)
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: kTextColor),
        bodyText2: TextStyle(color: kTextColor),
        button: TextStyle(fontSize: 17, color: kTextColor)
      ),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity
    );
  }

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outLineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 15
  );
  return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      enabledBorder: outLineInputBorder,
      focusedBorder: outLineInputBorder,
      border: outLineInputBorder
    );
}


