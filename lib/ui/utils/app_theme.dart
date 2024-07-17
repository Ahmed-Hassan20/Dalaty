import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryColor = Color(0xff113946);
  static Color whiteColor = Color(0xffE6E6E6);
  static Color blueColor = Color(0xff087da1);

  static ThemeData appTheme = ThemeData(
    primaryColor: primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: whiteColor,
      showSelectedLabels: false,
    ),
    textTheme: TextTheme(
      titleLarge:
      TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: primaryColor
      ),
      titleMedium:
      TextStyle(
          fontSize: 20,
          color:primaryColor
      ),
      titleSmall:
      TextStyle(
          fontSize: 18,
          color: primaryColor
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: primaryColor
      ),
    ),
  );
}