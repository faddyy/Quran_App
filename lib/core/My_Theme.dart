import 'package:flutter/material.dart';
import 'package:muslim/core/appcolor.dart';
import 'package:sizer/sizer.dart';

class MyTheme {
  static Color standardColor = const Color(0xFFB7935F);
  static Color standardColorDark = const Color(0xFF141B30);
  static Color blackColor = const Color(0xFF242424);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color yelloColor = const Color(0xFFa98d2e);
  static ThemeData lightmode = ThemeData(
    primaryColor: standardColor,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22.sp,
        color: blackColor,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 22.sp,
        color: blackColor,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        fontSize: 22.sp,
        color: blackColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
  );
  static ThemeData darkmode = ThemeData(
    primaryColor: standardColorDark,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22.sp,
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 22.sp,
        color: yelloColor,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        fontSize: 22.sp,
        color: blackColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: standardColor,
      unselectedItemColor: Colors.white,
    ),
  );
}
